import { fileURLToPath, URL } from 'node:url'

import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [vue()],
  define: {
    __VUE_PROD_HYDRATION_MISMATCH_DETAILS__: false // Set to false in production
  },
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url))
    },
    server: {
      proxy: {
        target: 'http://localhost:8000',
        changeOrigin: true,
        headers: {
          accept: 'application/json', 
          'content-type': 'application/json',
        },
      },
    },
  },
})
