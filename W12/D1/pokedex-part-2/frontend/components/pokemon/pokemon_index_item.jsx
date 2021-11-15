import React from 'react';
import { Link } from 'react-router-dom'

class PokemonIndexItem extends React.Component {
    constructor(props){
        super(props);
    }

    render(){
        
        let pokemon = this.props.pokemon
        return(

        <li className="pokemon-index-item">
          <Link to={`/pokemon/${pokemon.id}`}>
              <span>{pokemon.id}</span>
              <img src={pokemon.imageUrl} />
              <span>{pokemon.name}</span>
          </Link>
          </li>
        )
}
}

export default PokemonIndexItem