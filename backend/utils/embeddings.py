# embeddings.py
from sentence_transformers import SentenceTransformer

embedder = SentenceTransformer("all-MiniLM-L6-v2")  # 384-dim

def get_embedding(text: str):
    return embedder.encode(text).tolist()
