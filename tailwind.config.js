/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./doublespeed/**/*.{html,php,tpl,js}", "./src/**/*.css"],
  theme: {
    extend: {
      colors: {
        'dark-bg': '#121212',
        'dark-bg-alt': '#1A1A1A',
        'dark-surface': '#2A2A2A',
        'neon-green': '#00FF88',
        'electric-blue': '#007BFF',
        'cyber-purple': '#9B59B6',
        'text-light': '#BFBFBF',
        'text-white': '#FFFFFF',
      },
      fontFamily: {
        'orbitron': ['Orbitron', 'monospace'],
        'roboto': ['Roboto', 'sans-serif'],
      },
      boxShadow: {
        'glow-green': '0 0 20px rgba(0, 255, 136, 0.5)',
        'glow-blue': '0 0 20px rgba(0, 123, 255, 0.5)',
        'glow-purple': '0 0 20px rgba(155, 89, 182, 0.5)',
        'glow-white': '0 0 15px rgba(255, 255, 255, 0.3)',
      },
      animation: {
        'pulse-glow': 'pulse 2s cubic-bezier(0.4, 0, 0.6, 1) infinite',
        'float': 'float 3s ease-in-out infinite',
      },
      keyframes: {
        float: {
          '0%, 100%': { transform: 'translateY(0px)' },
          '50%': { transform: 'translateY(-10px)' },
        }
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
  ],
}