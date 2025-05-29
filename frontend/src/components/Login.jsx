import { useState } from 'react'
import { useNavigate } from 'react-router-dom'
import api from "../utils/axios"; // At the top


export default function Login() {
  const [username, setUsername] = useState('')
  const [password, setPassword] = useState('')
  const [error, setError] = useState('')
  const navigate = useNavigate()

  const handleLogin = async () => {
  try {
    const response = await api.post(
      "/login",
      new URLSearchParams({
        username,
        password
      })
    );

    const data = response.data;

    if (response.status === 200 && data.access_token) {
      localStorage.setItem("token", data.access_token);
      setError("");
      navigate("/dashboard");
    } else {
      setError(data.detail || "Invalid credentials");
    }
  } catch (err) {
    const message =
      err.response?.data?.detail || "Login failed. Please try again.";
    setError(message);
  }
};

  const handleRegister = async () => {
    try {
      const response = await fetch(`http://127.0.0.1:8000/register?username=${username}&password=${password}`, {
        method: 'POST',
      })

      const data = await response.json()
      if (response.ok) {
        alert('✅ Registration successful! You can now log in.')
        setError('')
      } else {
        setError(data.detail || 'Registration failed')
      }
    } catch (err) {
      setError('Registration failed')
    }
  }

  return (
    <div className="min-h-screen flex items-center justify-center bg-gray-100">
      <div className="bg-white p-8 rounded shadow-lg w-full max-w-md">
        <h1 className="text-2xl font-bold mb-6 text-center text-gray-800">🔐 Login or Register</h1>

        {error && <div className="mb-4 text-red-600 text-center">{error}</div>}

        <input
          className="w-full p-3 mb-4 border border-gray-300 rounded"
          type="text"
          placeholder="Username"
          value={username}
          onChange={(e) => setUsername(e.target.value)}
        />
        <input
          className="w-full p-3 mb-4 border border-gray-300 rounded"
          type="password"
          placeholder="Password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
        />

        <button
          className="w-full bg-blue-600 text-white py-2 rounded hover:bg-blue-700 transition mb-3"
          onClick={handleLogin}
        >
          Login
        </button>

        <button
          className="w-full bg-gray-300 text-black py-2 rounded hover:bg-gray-400 transition"
          onClick={handleRegister}
        >
          Register
        </button>
      </div>
    </div>
  )
}
