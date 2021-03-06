import React from "react";
import ReactDOM from "react-dom";
import { signUp, login, logout, getUsers } from "./util/session_api_util"
import configureStore from "./store/store";
import { receiveUsers,  } from "./actions/session_actions";
import Root from "./components/root";
import { fetchBenches } from "./actions/bench_actions";


const randomFunction = () => {
  console.log("i")
}
document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore({})
  const root = document.getElementById("root");
  ReactDOM.render(<Root store={store} />, root);
  // window.fetchBenches = fetchBenches

  window.store = store
  window.login = login
});