// src/components/ViewSummary.jsx
export default function ViewSummary() {
  const summary = localStorage.getItem('latestSummary') || 'No summary available.'

  return (
    <div className="bg-white p-6 rounded shadow w-full max-w-2xl mx-auto">
      <h1 className="text-2xl font-bold mb-6 text-center text-gray-800">📝 Latest Summary</h1>
      <p className="whitespace-pre-line text-gray-800">{summary}</p>
    </div>
  )
}
