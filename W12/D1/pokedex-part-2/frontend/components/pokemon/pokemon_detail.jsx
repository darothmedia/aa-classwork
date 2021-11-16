import React from 'react'

class PokemonDetail extends React.Component {
    constructor(props){
        super(props)
    }

    componentDidMount(){
        debugger
        this.props.requestSinglePokemon(this.props.match.params.pokemonId)
    }

    componentDidUpdate(prevProps){

    }

    render(){
        // console.log(this.props.match.params.pokemonId)
        const pokeId = this.props.pokemon[this.props.match.params.pokemonId]
        console.log(pokeId)
        // console.log(this.props.pokemon)
        return(
            <div>
                <h1>{pokeId ? pokeId.name : ""}</h1>
            </div>
        )
    }
}

export default PokemonDetail