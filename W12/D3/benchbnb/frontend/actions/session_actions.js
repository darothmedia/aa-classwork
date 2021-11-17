import * as APIutil from '../util/session_api_util'

export const LOG_OUT = 'LOG_OUT'
export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER'
export const RECEIVE_ERRORS = 'RECEIVE_ERRORS'
export const CLEAR_ERRORS = 'CLEAR_ERRORS'
export const RECEIVE_ALL_USERS = 'RECEIVE_ALL_USERS'

const receiveCurrentUser = currentUser => ({
  type: RECEIVE_CURRENT_USER,
  currentUser
})

const receiveAllUsers = users => ({
  type: RECEIVE_ALL_USERS,
  users
})

const logoutCurrentUser = () => ({
  type: LOG_OUT
})

const receiveErrors = (errors) => ({
  type: RECEIVE_ERRORS,
  errors
})

const clearErrors = () => ({
  type: CLEAR_ERRORS
})

export const receiveUsers = users => dispatch => (
  APIutil.getUsers(users)
    .then((users) => {
      dispatch(receiveAllUsers(users))
    })
)

export const signUp = user => dispatch => (
  APIutil.signUp(user)
    .then((user) => {
      dispatch(receiveCurrentUser(user)); 
      dispatch(clearErrors())
    }),
    error => dispatch(receiveErrors(error.responseJSON))
)

export const logIn = user => dispatch => (
  APIutil.login(user)
    .then((user) => {
      dispatch(receiveCurrentUser(user));
      dispatch(clearErrors())
    }),
    error => dispatch(receiveErrors(error.responseJSON))
)

export const logOut = () => dispatch => (
  APIutil.logout()
    .then(() => (
      dispatch(logoutCurrentUser())
    ))
)