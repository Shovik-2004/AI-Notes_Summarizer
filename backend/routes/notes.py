from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from database import get_db
from models import Note
from utils.auth import get_current_user
from utils.summarizer import summarize_text

router = APIRouter()

@router.post("/upload-note")
def upload_note(content: str, db: Session = Depends(get_db), current_user: dict = Depends(get_current_user)):
    if not content.strip():
        raise HTTPException(status_code=400, detail="Note content is empty")

    summary = summarize_text(content)


    note = Note(content=content, summary=summary, user_id=current_user.id)

    db.add(note)
    db.commit()
    db.refresh(note)

    return {"message": "Note saved successfully", "summary": summary}


@router.post("/summarize")
def summarize_note(content: str):
    if not content.strip():
        raise HTTPException(status_code=400, detail="Note content is empty")
    summary = summarize_text(content)
    return {"summary": summary}
