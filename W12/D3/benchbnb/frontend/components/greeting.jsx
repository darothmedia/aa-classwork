import React from "react";

export default ({user, logout}) => {
  const display = user ? (
    <>
      <h1>Hello, {user.username}!</h1>
      <button onClick={logout}>Log Out</button>
    </>
  ) : (
    <>
      <Link to='/signup'>Sign Up</Link>
      <Link to='/login'>Log In</Link>
    </>
  )
}