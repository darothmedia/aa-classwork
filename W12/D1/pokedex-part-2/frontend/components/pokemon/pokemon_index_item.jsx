import React from 'react';

class PokemonIndexItem extends React.Component {
    constructor(props){
        super(props);
    }

    render(){
        
        let pokemon = this.props.pokemon
        return(
             
        <li className="pokemon-index-item">
          <span>{pokemon.id}</span>
          <img src={pokemon.imageUrl}/>
          <span>{pokemon.name}</span> 
          </li>
        )
               }
}

export default PokemonIndexItem