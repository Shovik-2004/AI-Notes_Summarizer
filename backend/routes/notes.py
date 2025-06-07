from fastapi import APIRouter, Depends, HTTPException, Form, Query
from sqlalchemy.orm import Session
from database import get_db
from models import Note
from utils.auth import get_current_user
from utils.summarizer import summarize_text
from utils.pinecone_client import upsert_note, search_similar_notes
from schemas import NoteOut
from pydantic import BaseModel
from typing import List, Dict, Any
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
    try:
        pinecone_result = search_similar_notes(
            query_text=query,
            user_id=str(current_user.id),  
            top_k=5
        )
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Search failed: {str(e)}")

    
    matches = pinecone_result if isinstance(pinecone_result, list) else pinecone_result.get("matches", [])

    matching_notes = []
    for match in matches:
        note_id = match.get("id")
        if not note_id:
            continue
        note = db.query(Note).filter(Note.id == int(note_id)).first()
        if note:
            matching_notes.append({
                "id": note.id,
                "content": note.content,
                "summary": note.summary
            })

    return {"results": matching_notes}