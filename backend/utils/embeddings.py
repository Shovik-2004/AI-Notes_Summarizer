from sentence_transformers import SentenceTransformer

# Load model once at startup
model = SentenceTransformer("all-MiniLM-L6-v2")  # ✅ This is a small, fast, and effective model

def get_embedding(text: str):
    """
    Generate embedding locally using sentence-transformers.
    Returns a flat list of floats.
    """
    try:
        embedding = model.encode(text, convert_to_numpy=True).tolist()
        return embedding
    except Exception as e:
        print(f"❌ Error generating local embedding: {e}")
        return []
