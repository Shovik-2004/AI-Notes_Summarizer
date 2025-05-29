// src/components/Dashboard.jsx
import { Outlet, Link, useLocation } from 'react-router-dom'

export default function Dashboard() {
  const location = useLocation()
  const isBaseDashboard = location.pathname === '/dashboard'

  const handleLogout = () => {
    localStorage.removeItem('token')
    window.location.href = '/login'
  }

  return (
    <div className="min-h-screen bg-gray-100">
      {/* Top Bar */}
      <div className="bg-white w-full shadow-md px-8 py-6">
        <h1 className="text-3xl font-bold text-gray-800 mb-4 text-center">📋 Dashboard</h1>
        <nav className="flex justify-center space-x-8 mb-4">
          {!isBaseDashboard && (
            <>
              <Link to="upload" className="text-blue-600 hover:text-blue-800 font-medium">
                Upload Note
              </Link>
              <Link to="summary" className="text-blue-600 hover:text-blue-800 font-medium">
                View Summary
              </Link>
              <Link to="previous" className="text-blue-600 hover:text-blue-800 font-medium">
                Previous Notes
              </Link>
              <Link to="search" className="text-blue-600 hover:text-blue-800 font-medium">
                Search Notes
              </Link>
            </>
          )}
          <button onClick={handleLogout} className="text-red-500 hover:text-red-700 font-medium">
            Logout
          </button>
        </nav>
      </div>

      {/* Main Content */}
      <div className="p-8">
        {isBaseDashboard ? (
          <div className="flex flex-col items-center justify-center h-[60vh] space-y-6">
            <Link
              to="upload"
              className="bg-blue-500 text-white font-semibold py-3 px-8 rounded shadow-md hover:bg-blue-600 transition flex items-center space-x-2"
            >
              <span>📄</span>
              <span>Upload Note</span>
            </Link>
            <Link
              to="summary"
              className="bg-green-500 text-white font-semibold py-3 px-8 rounded shadow-md hover:bg-green-600 transition flex items-center space-x-2"
            >
              <span>📑</span>
              <span>View Summary</span>
            </Link>
            <Link
              to="previous"
              className="bg-purple-500 text-white font-semibold py-3 px-8 rounded shadow-md hover:bg-purple-600 transition flex items-center space-x-2"
            >
              <span>🕓</span>
              <span>Previous Notes</span>
            </Link>
            <Link
              to="search"
              className="bg-yellow-500 text-white font-semibold py-3 px-8 rounded shadow-md hover:bg-yellow-600 transition flex items-center space-x-2"
            >
              <span>🔍</span>
              <span>Search Notes</span>
            </Link>
          </div>
        ) : (
          <Outlet />
        )}
      </div>
    </div>
  )
}
