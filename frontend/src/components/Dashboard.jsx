// src/components/Dashboard.jsx
import { Outlet, Link, useNavigate } from 'react-router-dom'

export default function Dashboard() {
  const navigate = useNavigate()

  const handleLogout = () => {
    localStorage.removeItem('token')
    navigate('/login')  // redirects without full reload
  }

  return (
    <div className="min-h-screen bg-gray-100 p-4">
      <h1 className="text-2xl font-bold mb-4 text-center">📋 Dashboard</h1>

      <nav className="flex justify-center space-x-4 mb-6">
        <Link to="upload" className="text-blue-600 hover:underline">Upload Note</Link>
        <Link to="summary" className="text-blue-600 hover:underline">View Summary</Link>
        <Link to="previous" className="text-blue-600 hover:underline">Previous Notes</Link>
        <button
          onClick={handleLogout}
          className="text-red-600 hover:underline ml-4"
        >
          Logout
        </button>
      </nav>

      <Outlet />
    </div>
  )
}
