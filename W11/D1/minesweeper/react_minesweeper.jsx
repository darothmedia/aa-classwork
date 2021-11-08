import React from 'react'
import ReactDOM from 'react-dom'
import Game from './components/game.jsx'

document.addEventListener('DOMContentLoaded', (event) => {
  let root = document.getElementById('root')
  ReactDOM.render(<Game />, root)
})