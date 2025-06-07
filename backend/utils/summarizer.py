import os
import requests
from dotenv import load_dotenv
from typing import Optional

load_dotenv()

API_URL = "https://api-inference.huggingface.co/models/facebook/bart-large-cnn"
HF_API_KEY = os.getenv("HF_API_KEY", "")

headers = {
    "Authorization": f"Bearer {HF_API_KEY}",
    "Content-Type": "application/json"
}

def summarize_text(content: str) -> str:
    if not HF_API_KEY:
        return "Hugging Face API key not set in environment variables."

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
        data = response.json()

        if isinstance(data, list) and "summary_text" in data[0]:
            return data[0]["summary_text"]
        else:
            return f"Unexpected response format: {data}"
    except requests.exceptions.RequestException as e:
        return f"API request failed: {e}"
    except Exception as e:
        return f"An error occurred: {e}"
