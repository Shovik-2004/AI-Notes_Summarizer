// src/components/ProtectedRoute.jsx
import { Navigate } from 'react-router-dom'
import { isTokenExpired } from '../utils/auth'

export default function ProtectedRoute({ children }) {
  const token = localStorage.getItem('token')

  if (!token || isTokenExpired(token)) {
    localStorage.removeItem('token') // Auto logout
    return <Navigate to="/login" />
  }

  return children
}
