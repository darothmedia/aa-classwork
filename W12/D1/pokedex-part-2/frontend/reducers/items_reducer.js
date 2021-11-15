import { RECEIVE_SINGLE_POKEMON } from "../actions/pokemon_actions"

const itemsReducer = (state = {}, action) => {
  Object.freeze(state);
  let newState = Object.assign({}, state)
  switch (action.type) {
    case RECEIVE_SINGLE_POKEMON:
      // debugger
      // action.pokemon.items.forEach((item) => {
        return action.pokemon.items
      // })
      // return newState 
    default:
      return state;
  }
}

export default itemsReducer