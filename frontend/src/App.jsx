// src/App.jsx
import { useEffect } from 'react'
import { Routes, Route, Navigate } from 'react-router-dom'
import { jwtDecode } from 'jwt-decode' 
import Login from './components/Login'
import Register from './components/Register'
import Dashboard from './components/Dashboard'
import UploadNote from './components/UploadNote'
import ViewSummary from './components/ViewSummary'
import PreviousNotes from './components/PreviousNotes'
import SearchNotes from './components/SearchNotes'
import ProtectedRoute from './components/ProtectedRoute'

export default function App() {
  useEffect(() => {
    const token = localStorage.getItem('token')
    if (token) {
      try {
        const decoded = jwtDecode(token)
        const expiry = decoded.exp * 1000
        const now = Date.now()
        const timeout = expiry - now

        if (timeout > 0) {
          const timer = setTimeout(() => {
            localStorage.removeItem('token')
            window.location.href = '/login'
          }, timeout)

          return () => clearTimeout(timer)
        } else {
          localStorage.removeItem('token')
        }
      } catch (err) {
        console.error('Invalid token:', err)
        localStorage.removeItem('token')
      }
    }
  }, [])

  return (
    <Routes>
      <Route path="/" element={<Navigate to="/login" />} />
      <Route path="/login" element={<Login />} />
      <Route path="/register" element={<Register />} />

      {/* ✅ Protected Routes */}
      <Route
        path="/dashboard"
        element={
          <ProtectedRoute>
            <Dashboard />
          </ProtectedRoute>
        }
      >
        <Route path="upload" element={<UploadNote />} />
        <Route path="summary" element={<ViewSummary />} />
        <Route path="previous" element={<PreviousNotes />} />
        <Route path="search" element={<SearchNotes />} /> {/* ✅ Search Notes added */}
      </Route>

      <Route path="*" element={<Navigate to="/" />} />
    </Routes>
  )
}
