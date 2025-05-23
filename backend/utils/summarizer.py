import os
import requests
from dotenv import load_dotenv

load_dotenv()

def summarize_text(content: str) -> str:
    API_URL = "https://api-inference.huggingface.co/models/facebook/bart-large-cnn"
    headers = {
        "Authorization": f"Bearer {os.getenv('HF_API_KEY')}"
    }

    payload = {
        "inputs": content,
        "parameters": {
            "min_length": 20,
            "max_length": 80,
            "do_sample": False
        }
    }

    try:
        response = requests.post(API_URL, headers=headers, json=payload)
        response.raise_for_status()
        summary = response.json()[0]["summary_text"]
        return summary
    except Exception as e:
        return f"❌ Failed to summarize: {str(e)}"
