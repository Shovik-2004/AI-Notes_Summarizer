# 🧠 AI-Powered Note-Taking App

A simple, intelligent note-taking application that allows users to paste or upload long-form content and get **Instant AI-generated summaries**, view all past notes, and even **search notes semantically** using Pinecone.

> “I want to upload or paste a note, and quickly get a summary so I can revisit the main ideas without reading everything again.” — ✅ Mission Accomplished

---

## 🚀 Features

### ✅ Core Functionality

- 🔐 **User Authentication (JWT)**
  - Secure register and login system
  - Token-based session handling with auto-logout on expiry

- 📝 **Upload or Paste Note**
  - Paste large note content directly
  - Automatic summarization triggered on upload
  - Notes stored in PostgreSQL database

- 🧠 **AI Summarization**
  - Local summarization using Hugging Face `sentence-transformers` model
  - Fast and accurate results with `all-MiniLM-L6-v2`

- 📂 **View Previous Notes**
  - Displays user-specific notes with content + summary
  - Neatly styled list with responsive layout

- 🔍 **Semantic Search with Pinecone**
  - Uses Pinecone to store vector embeddings (384-dim)
  - Users can search notes with natural language
  - Results filtered to current user only

---

## 🧰 Tech Stack

### 👨‍💻 Backend – FastAPI

- Framework: `FastAPI`
- Auth: `JWT` with token expiry
- ORM: `SQLAlchemy` with PostgreSQL
- AI: `HuggingFace` for embedding and summarization
- Vector DB: `Pinecone` for semantic search

### 💻 Frontend – React + Vite

- Framework: `React` with `Vite` for fast builds
- Routing: `react-router-dom`
- Styling: `TailwindCSS`
- Components:
  - Login/Register
  - Dashboard
  - Upload Note
  - View Summary
  - Previous Notes
  - Search Notes

---
