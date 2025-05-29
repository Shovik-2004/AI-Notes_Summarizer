// src/utils/auth.js

import { jwtDecode } from 'jwt-decode'

export function isTokenExpired(token) {
  try {
    const decoded = jwtDecode(token)
    const currentTime = Date.now() / 1000 // in seconds
    return decoded.exp < currentTime
  } catch (err) {
    return true 
  }
}
