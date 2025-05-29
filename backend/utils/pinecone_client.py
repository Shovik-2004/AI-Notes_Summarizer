# backend/utils/pinecone_client.py
import os
from dotenv import load_dotenv
from pinecone import Pinecone
from typing import Dict, Any, List
from utils.embeddings import get_embedding  # Hugging Face API-based

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
        print(f"❌ Failed to upsert: No embedding generated for note ID {note_id}")
        return

    index.upsert(vectors=[{
        "id": note_id,
        "values": embedding,
        "metadata": metadata
    }])
    print(f"✅ Successfully upserted note ID {note_id} into Pinecone")

def search_similar_notes(query_text: str, top_k: int = 5) -> List[Dict[str, Any]]:
    """
    Search Pinecone using embedding of query_text and return top_k matches.
    """
    query_embedding = get_embedding(query_text)
    if not query_embedding:
        print("❌ Failed to generate embedding for search query")
        return []

    result = index.query(
        vector=query_embedding,
        top_k=top_k,
        include_metadata=True
    )
    return result.get("matches", [])
