import React from "react";
import { connect } from 'react-redux'
import Greeting from "./greeting";
import { logOut } from "../actions/session_actions";

const mSTP = state => ({
  user: state.entities.users[state.session.id]
})

const mDTP = dispatch => ({
  logout: () => dispatch(logOut())
})

export default connect(mSTP, mDTP)(Greeting)