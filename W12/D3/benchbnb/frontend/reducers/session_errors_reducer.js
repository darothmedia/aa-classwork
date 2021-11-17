import { RECEIVE_ERRORS, RECEIVE_CURRENT_USER } from "../actions/session_actions";

const sessionErrorsReducer = (state = {}, action) => {
  Object.freeze(state);
  const _nullUser = Object.freeze({}, {id: null})
  switch(action.type) {
    case RECEIVE_ERRORS:
      return Object.assign({}, { errors: error.responseJSON })
    case RECEIVE_CURRENT_USER:
      return Object.assign({}, { errors: null })
    default:
      return state;
  }
}

export default sessionErrorsReducer