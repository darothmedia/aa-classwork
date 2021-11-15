import React from 'react';
import PokemonIndexItem from './pokemon_index_item'


class PokemonIndex extends React.Component{
  constructor(props){
  super(props)
  }
  
  componentDidMount(){
  this.props.requestAllPokemon()
  }

 
  
  render(){
    // console.log(this.props.pokemon)
    let pokemon = this.props.pokemon
     const pokemonItems = pokemon.map(poke => (
    <PokemonIndexItem key={poke.id} pokemon={poke} />
  ));
    return (
    <section className="pokedex">
      <ul>
      {/* {this.props.pokemon.map((poke) => (
        <li className="pokemon-index-item">
          <span>{poke.id}</span>
          <img src={poke.imageUrl}/>
          <span>{poke.name}</span> */}
          <section className="pokedex">
  <ul>{pokemonItems}</ul>
</section>;
        //
      ))
      </ul>
    </section>
    )
  }
  }
  
  
  
  export default PokemonIndex;