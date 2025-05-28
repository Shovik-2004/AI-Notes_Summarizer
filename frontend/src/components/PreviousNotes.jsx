// src/components/PreviousNotes.jsx
import { useEffect, useState } from 'react'

export default function PreviousNotes() {
  const [notes, setNotes] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')

  useEffect(() => {
    const fetchNotes = async () => {
      try {
        const response = await fetch('http://127.0.0.1:8000/notes', {
          headers: {
            Authorization: `Bearer ${localStorage.getItem('token')}`,
          },
        })

        if (!response.ok) {
          throw new Error('Failed to fetch notes')
        }

        const data = await response.json()
        setNotes(data)
      } catch (err) {
        console.error('Error fetching notes:', err)
        setError('❌ Unable to load notes.')
      } finally {
        setLoading(false)
      }
    }

    fetchNotes()
  }, [])

  return (
    <div className="bg-white p-6 rounded shadow w-full max-w-3xl mx-auto">
      <h2 className="text-xl font-bold mb-4">📜 Previous Notes</h2>

      {loading ? (
        <p>Loading...</p>
      ) : error ? (
        <p className="text-red-600">{error}</p>
      ) : notes.length === 0 ? (
        <p>No previous notes found.</p>
      ) : (
        <ul className="space-y-4">
          {notes.map((note) => (
            <li key={note.id} className="border p-4 rounded bg-gray-50">
              <p className="mb-2"><strong>📝 Note:</strong> {note.content}</p>
              <p><strong>📄 Summary:</strong> {note.summary}</p>
            </li>
          ))}
        </ul>
      )}
    </div>
  )
}
