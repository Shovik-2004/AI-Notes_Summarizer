# backend/utils/embeddings.py
import os
import requests
from dotenv import load_dotenv

load_dotenv()

HF_API_KEY = os.getenv("HF_API_KEY")

def get_embedding(text: str):
    """
    Get embedding from Hugging Face Inference API (example: sentence-transformers/all-MiniLM-L6-v2)
    """
    response = requests.post(
        "https://api-inference.huggingface.co/pipeline/feature-extraction/sentence-transformers/all-MiniLM-L6-v2",
        headers={"Authorization": f"Bearer {HF_API_KEY}"},
        json={"inputs": text}
    )
    response.raise_for_status()
    embedding = response.json()

    # Hugging Face may return [ [..] ], so flatten if needed
    if isinstance(embedding, list) and isinstance(embedding[0], list):
        embedding = embedding[0]
    return embedding
