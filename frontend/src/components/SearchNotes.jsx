// src/components/SearchNotes.jsx
import { useState } from 'react'

export default function SearchNotes() {
  const [query, setQuery] = useState('')
  const [results, setResults] = useState([])
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')

  const handleSearch = async () => {
    if (!query.trim()) return
    setLoading(true)
    setError('')

    try {
      const response = await fetch(
        `http://127.0.0.1:8000/search-notes?query=${encodeURIComponent(query)}`,
        {
          headers: {
            Authorization: `Bearer ${localStorage.getItem('token')}`,
          },
        }
      )

      if (!response.ok) throw new Error('Search failed')
      const data = await response.json()
      setResults(data.results || [])
    } catch (err) {
      console.error(err)
      setError('❌ Failed to fetch search results')
    } finally {
      setLoading(false)
    }
  }

  return (
    <div className="bg-white p-6 rounded shadow max-w-3xl mx-auto mt-8">
      <h2 className="text-2xl font-bold text-center text-gray-800 mb-6">🔍 Search Notes</h2>

      <div className="flex gap-4 mb-4">
        <input
          type="text"
          className="w-full border p-3 rounded"
          placeholder="Enter your search query..."
          value={query}
          onChange={(e) => setQuery(e.target.value)}
        />
        <button
          className="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700"
          onClick={handleSearch}
        >
          Search
        </button>
      </div>

      {loading && <p>Searching...</p>}
      {error && <p className="text-red-500">{error}</p>}

      <ul className="space-y-4 mt-4">
        {results.map((res) => (
          <li key={res.id} className="border rounded p-4 bg-gray-50 text-gray-800">
            <p><strong>ID:</strong> {res.id}</p>
            <p><strong>Content:</strong> {res.content}</p>
            <p><strong>Summary:</strong> {res.summary}</p>
          </li>
        ))}
      </ul>
    </div>
  )
}
