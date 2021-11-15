import { RECEIVE_ALL_POKEMON, RECEIVE_SINGLE_POKEMON } from './../actions/pokemon_actions';


const pokemonReducer = (state = {}, action) => {
  // debugger
  Object.freeze(state);
  // let newState = Object.assign({}, state)
  switch (action.type){
  case RECEIVE_ALL_POKEMON:
    return Object.assign({}, action.pokemon, state);
  case RECEIVE_SINGLE_POKEMON:
    return Object.assign({}, state, {[action.pokemon.pokemon.id]: action.pokemon.pokemon})
  default:
    return state;
  }
}
  
export default pokemonReducer;
