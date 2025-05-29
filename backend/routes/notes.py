from fastapi import APIRouter, Depends, HTTPException, Form, Query
from sqlalchemy.orm import Session
from database import get_db
from models import Note
from utils.auth import get_current_user
from utils.summarizer import summarize_text
from utils.pinecone_client import upsert_note, search_similar_notes
from typing import List
from schemas import NoteOut
from pydantic import BaseModel

router = APIRouter()

class SearchQuery(BaseModel):
    query: str

@router.post("/upload-note")
def upload_note(
    content: str = Form(...),
    db: Session = Depends(get_db),
    current_user: dict = Depends(get_current_user)
):
    if not content.strip():
        raise HTTPException(status_code=400, detail="Note content is empty")

    summary = summarize_text(content)

    note = Note(content=content, summary=summary, user_id=current_user.id)
    db.add(note)
    db.commit()
    db.refresh(note)

    # Upsert note to Pinecone (embedding handled inside upsert_note)
    upsert_note(str(note.id), content, {"user_id": str(current_user.id)})

    return {"message": "Note saved successfully", "summary": summary}

@router.post("/summarize")
def summarize_note(content: str):
    if not content.strip():
        raise HTTPException(status_code=400, detail="Note content is empty")
    summary = summarize_text(content)
    return {"summary": summary}

@router.get("/notes", response_model=List[NoteOut])
def get_notes(db: Session = Depends(get_db), current_user: dict = Depends(get_current_user)):
    notes = db.query(Note).filter(Note.user_id == current_user.id).all()
    return notes  

@router.get("/search-notes")
def search_notes(
    query: str = Query(..., min_length=3),
    db: Session = Depends(get_db),
    current_user: dict = Depends(get_current_user)
):
    results = search_similar_notes(query_embedding=query, top_k=5)

    matching_notes = []
    for match in results.get('matches', []):
        metadata = match.get('metadata', {})
        if metadata.get("user_id") == str(current_user.id):
            note = db.query(Note).filter(Note.id == int(match["id"])).first()
            if note:
                matching_notes.append({
                    "id": note.id,
                    "content": note.content,
                    "summary": note.summary
                })

    return {"results": matching_notes}
