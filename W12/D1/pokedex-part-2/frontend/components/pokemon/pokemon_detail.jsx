import React from 'react'

class PokemonDetail extends React.Component {
    constructor(props){
        super(props)
    }

    render(){
        return(
            <div>
                <h1>{this.props.pokemon.pokemon.name}</h1>
            </div>
        )
    }
}

export default PokemonDetail