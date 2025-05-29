# backend/utils/embeddings.py
import os
import requests
from dotenv import load_dotenv

load_dotenv()

HF_API_KEY = os.getenv("HF_API_KEY")

def get_embedding(text: str):
    """
    Get embedding from Hugging Face Inference API (example: sentence-transformers/all-MiniLM-L6-v2)
    Returns a flat list of floats representing the embedding.
    """
    try:
        response = requests.post(
            "https://api-inference.huggingface.co/pipeline/feature-extraction/sentence-transformers/all-MiniLM-L6-v2",
            headers={"Authorization": f"Bearer {HF_API_KEY}"},
            json={"inputs": text}
        )
        response.raise_for_status()
        embedding = response.json()

        # Hugging Face typically returns [[...]] — flatten if needed
        if isinstance(embedding, list) and isinstance(embedding[0], list):
            embedding = embedding[0]

        if not isinstance(embedding, list) or not all(isinstance(i, (float, int)) for i in embedding):
            raise ValueError("Invalid embedding format returned from Hugging Face API")

        return embedding

    except Exception as e:
        print(f"❌ Error fetching embedding: {e}")
        return []
