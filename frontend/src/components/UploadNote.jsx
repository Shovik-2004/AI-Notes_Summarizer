import { useState } from 'react'

export default function UploadNote() {
  const [note, setNote] = useState('')
  const [summary, setSummary] = useState('')
  const [loading, setLoading] = useState(false)

  const handleUpload = async () => {
  setLoading(true)
  try {
    const response = await fetch('http://127.0.0.1:8000/upload-note', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        Authorization: `Bearer ${localStorage.getItem('token')}`,
      },
      body: new URLSearchParams({ content: note }),
    })

    const data = await response.json()
    localStorage.setItem('latestSummary', data.summary)
    setSummary(data.summary || 'No summary returned.')
  } catch (error) {
    console.error('Upload failed:', error)
    setSummary('❌ Failed to summarize note.')
  } finally {
    setLoading(false)
  }
}


  return (
    <div className="bg-white p-6 rounded shadow w-full max-w-2xl mx-auto">
      <h1 className="text-2xl font-bold mb-4 text-center">📤 Upload Note</h1>

      <textarea
        className="w-full p-3 border rounded mb-4 h-40"
        placeholder="Paste your note here..."
        value={note}
        onChange={(e) => setNote(e.target.value)}
      />

      <button
        className="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 w-full"
        onClick={handleUpload}
        disabled={loading}
      >
        {loading ? 'Summarizing...' : 'Upload and Summarize'}
      </button>

      {summary && (
        <div className="mt-6 bg-gray-100 p-4 rounded border">
          <h2 className="font-semibold mb-2">📝 Summary</h2>
          <p className="whitespace-pre-line text-gray-800">{summary}</p>
        </div>
      )}
    </div>
  )
}
