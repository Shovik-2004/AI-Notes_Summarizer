# backend/utils/pinecone_client.py
import os
from pinecone import Pinecone
from dotenv import load_dotenv

load_dotenv()

PINECONE_API_KEY = os.getenv("PINECONE_API_KEY")
INDEX_NAME = os.getenv("INDEX_NAME") or "notes-index3"

# Initialize Pinecone client
pc = Pinecone(api_key=PINECONE_API_KEY)

# Connect to existing index
index = pc.Index(INDEX_NAME)

def upsert_note_embedding(note_id: str, embedding: list, metadata: dict):
    index.upsert(vectors=[{
        "id": note_id,
        "values": embedding,
        "metadata": metadata
    }])

def search_similar_notes(query_embedding: list, top_k: int = 5):
    result = index.query(vector=query_embedding, top_k=top_k, include_metadata=True)
    return result
