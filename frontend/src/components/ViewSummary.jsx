// src/components/ViewSummary.jsx
export default function ViewSummary() {
  const summary = localStorage.getItem('latestSummary') || 'No summary available.'

  return (
    <div className="bg-white p-6 rounded shadow w-full max-w-2xl mx-auto">
      <h2 className="text-xl font-bold mb-4">📝 Latest Summary</h2>
      <p className="whitespace-pre-line text-gray-800">{summary}</p>
    </div>
  )
}
