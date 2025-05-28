from pydantic import BaseModel

class NoteOut(BaseModel):
    id: int
    content: str
    summary: str

    class Config:
        orm_mode = True
