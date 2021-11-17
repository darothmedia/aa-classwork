import {postUser, postSession, deleteSession} from '../utils/session'

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER'
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER'

const receiveCurentUser = user => ({
  type: RECEIVE_CURRENT_USER,
  user,
});

const logoutCurrentUser = () => ({
  type: LOGOUT_CURRENT_USER,
})

export const createNewUser = formUser => dispatch => postUser(formUser)
  .then(user => dispatch(receiveCurentUser(user)));

export const login = formUser => dispatch => postSession(formUser)
  .then(user => dispatch(receiveCurentUser(user)));

export const logout = () => dispatch => deleteSession()
  .then(() => dispatch(logoutCurrentUser()))