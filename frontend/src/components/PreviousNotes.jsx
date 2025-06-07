// src/components/PreviousNotes.jsx
import { useEffect, useState } from 'react'
import api from '../utils/axios' 

export default function PreviousNotes() {
  const [notes, setNotes] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')

  useEffect(() => {
    const fetchNotes = async () => {
      try {
        const response = await api.get('/notes')
        setNotes(response.data)
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
    <div className="bg-white p-6 rounded shadow w-full max-w-4xl mx-auto mt-8">
      <h2 className="text-3xl font-bold mb-6 text-center text-gray-900">📜 Previous Notes</h2>

      {loading ? (
        <p className="text-center text-gray-700">Loading...</p>
      ) : error ? (
        <p className="text-center text-red-600">{error}</p>
      ) : notes.length === 0 ? (
        <p className="text-center text-gray-600">No previous notes found.</p>
      ) : (
        <ul className="space-y-6">
          {notes.map((note) => (
            <li key={note.id} className="bg-gray-100 p-5 rounded shadow text-gray-800 border border-gray-300">
              <p className="mb-2"><strong>📝 Note:</strong> {note.content}</p>
              <p><strong>📄 Summary:</strong> {note.summary}</p>
            </li>
          ))}
        </ul>
      )}
    </div>
  )
}
