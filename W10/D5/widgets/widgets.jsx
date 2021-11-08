import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './frontend/clock';
import Tab from './frontend/tabs'

document.addEventListener("DOMContentLoaded", (event) => {
  const root = document.getElementById("root");
  const root2 = document.getElementById("roots");
  ReactDOM.render(<Clock  />, root);
  ReactDOM.render(<Tab />, root2);
});