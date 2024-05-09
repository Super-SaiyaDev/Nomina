import React from 'react'
import ReactDOM from 'react-dom/client'
import Path from './router/router'
import './index.css'
import Modal from 'react-modal';

Modal.setAppElement('#root')  
ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <Path />
  </React.StrictMode>,
)
