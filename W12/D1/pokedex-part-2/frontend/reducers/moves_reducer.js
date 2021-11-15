import { RECEIVE_SINGLE_POKEMON } from "../actions/pokemon_actions"

const movesReducer = (state = {}, action) => {
  Object.freeze(state);
  let newState = Object.assign({}, state)
  switch (action.type) {
    case RECEIVE_SINGLE_POKEMON:
      newState[action.pokemon.id] = action.pokemon.moves;
      return newState
    default:
      return state;
  }
}

export default movesReducer