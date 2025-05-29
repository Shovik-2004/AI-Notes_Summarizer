import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [react()],
  build: {
    outDir: 'dist', // Required for Render to know where to serve the files from
  },
  server: {
    port: 5173, // Optional: Useful for local dev
  },
});
