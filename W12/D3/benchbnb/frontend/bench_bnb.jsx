import React from "react";
import ReactDOM from "react-dom";
import { signUp, login, logout, getUsers } from "./util/session_api_util"
import configureStore from "./store/store";
import { receiveUsers,  } from "./actions/session_actions";


const randomFunction = () => {
  console.log("i")
}



document.addEventListener("DOMContentLoaded", () => {
  let store = configureStore({})
  const root = document.getElementById("root");
  ReactDOM.render(<h1>BenchBNB</h1>, root);
  window.getState = store.getState
  window.dispatch = store.dispatch
  window.receiveUsers = receiveUsers
  window.login = login
  window.getUsers = getUsers
  window.logout = logout
  window.signUp = signUp
  window.randomFunction = randomFunction
});