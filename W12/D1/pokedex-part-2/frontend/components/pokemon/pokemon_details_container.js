import {connect} from 'react-redux';
import {requestAllPokemon, requestSinglePokemon} from './../../actions/pokemon_actions';
import {selectAllPokemon} from './../../reducers/selectors';
import PokemonDetail from './pokemon_detail';

const mapStateToProps = state => ({
    pokemon: state.entities.pokemon
})

const mapDispatchToProps = dispatch => ({
    requestSinglePokemon: pokemonId => dispatch(requestSinglePokemon(pokemonId)),
})

export default connect(mapStateToProps, mapDispatchToProps)(PokemonDetail)