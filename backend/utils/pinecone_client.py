# backend/utils/pinecone_client.py
import os
from dotenv import load_dotenv
from pinecone import Pinecone
from typing import Dict, Any
from utils.embeddings import get_embedding  # use Hugging Face API

load_dotenv()

PINECONE_API_KEY = os.getenv("PINECONE_API_KEY")
INDEX_NAME = os.getenv("INDEX_NAME", "notes-index3")

# Initialize Pinecone client
pc = Pinecone(api_key=PINECONE_API_KEY)
index = pc.Index(INDEX_NAME)

def upsert_note(note_id: str, note_text: str, metadata: Dict[str, Any]) -> None:
    """
    Auto-generates embedding from text and upserts it into Pinecone.
    """
    embedding = get_embedding(note_text)
    index.upsert(vectors=[{
        "id": note_id,
        "values": embedding,
        "metadata": metadata
    }])

def search_similar_notes(query_text: str, top_k: int = 5):
    """
    Searches for top_k similar notes using embedding from query_text.
    """
    query_embedding = get_embedding(query_text)
    result = index.query(
        vector=query_embedding,
        top_k=top_k,
        include_metadata=True
    )
    return result.get("matches", [])
