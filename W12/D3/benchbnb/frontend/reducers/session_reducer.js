import { RECEIVE_CURRENT_USER, LOG_OUT } from "../actions/session_actions";

const sessionReducer = (state = {}, action) => {
  Object.freeze(state);
  const _nullUser = Object.freeze({}, {id: null})
  switch(action.type) {
    case RECEIVE_CURRENT_USER:
      return Object.assign({}, { id: action.currentUser.id })
    case LOG_OUT:
      return _nullUser
    default:
      return state;
  }
}

export default sessionReducer