from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from routes import auth, notes 
from dotenv import load_dotenv
from fastapi.responses import RedirectResponse
import os

load_dotenv()

# Optional: log or check that your API key is loaded
OPENAI_API_KEY = os.getenv("OPENAI_API_KEY")
if not OPENAI_API_KEY:
    print("Warning: OPENAI_API_KEY is not set!")

app = FastAPI(
    title="📝 AI Note-Taking API",
    description="A FastAPI backend for summarizing and searching notes using Hugging Face and Pinecone.",
    version="1.0.0"
)

# CORS middleware for frontend-backend interaction
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Allow all origins during dev
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Redirect root (/) to Swagger UI
@app.get("/", include_in_schema=False)
def redirect_to_docs():
    return RedirectResponse(url="/docs")

# Include auth and note routes
app.include_router(auth.router)
app.include_router(notes.router)
