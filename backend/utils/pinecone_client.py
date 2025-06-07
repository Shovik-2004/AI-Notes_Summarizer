import os
from dotenv import load_dotenv
from pinecone import Pinecone
from typing import Dict, Any, List
from utils.embeddings import get_embedding 

load_dotenv()

PINECONE_API_KEY = os.getenv("PINECONE_API_KEY")
INDEX_NAME = os.getenv("INDEX_NAME", "notes-index3")

# Initialize Pinecone client
pc = Pinecone(api_key=PINECONE_API_KEY)
index = pc.Index(INDEX_NAME)

def upsert_note(note_id: str, note_text: str, metadata: Dict[str, Any]) -> None:
    """
    Generate embedding from note_text and upsert to Pinecone with metadata.
    """
    embedding = get_embedding(note_text)
    if not embedding:
        print(f"Failed to upsert: No embedding generated for note ID {note_id}")
        return

    index.upsert(vectors=[{
        "id": note_id,
        "values": embedding,
        "metadata": metadata
    }])
    print(f"Successfully upserted note ID {note_id} into Pinecone")

def search_similar_notes(query_text: str, user_id: str, top_k: int = 5) -> List[Dict[str, Any]]:
    embedding = get_embedding(query_text)
    if not embedding:
        print("Failed to generate embedding for search query")
        return []

    try:
        result = index.query(
            vector=embedding,
            top_k=top_k,
            include_metadata=True,
            filter={"user_id": user_id}
        )
        return result.get("matches", [])
    except Exception as e:
        print(f"Pinecone query error: {e}")
        return []
