import React from "react";
import {Link} from 'react-router-dom'

export default ({user, logout}) => {
  if (user) {
    return(
    <>
      <h1>Hello, {user}!</h1>
      <button onClick={logout}>Log Out</button>
    </>
    )}
    else {
      return(
        <>
          <Link to='/signup'>Sign Up</Link>
          <br />
          <Link to='/login'>Log In</Link>
        </>
      )
    }
}