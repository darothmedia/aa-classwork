import React from 'react'

class PokemonDetail extends React.Component {
    constructor(props){
        super(props)
    }

    componentDidMount(){

        this.props.requestSinglePokemon(this.props.match.params.pokemonId)
    }

    componentDidUpdate(prevProps){
        if(prevProps !== this.props){
        this.props.requestSinglePokemon(this.props.match.params.pokemonId)
        } 
    }

    render(){
        // console.log(this.props.match.params.pokemonId)
        const pokeId = this.props.pokemon[this.props.match.params.pokemonId]
        console.log(pokeId)
        // console.log(this.props.pokemon)
        return(
            <div>
               
                <h1>{pokeId ? pokeId.name : ""}</h1>
                <ul>
                    <li>{pokeId ? "attact: " + pokeId.attack : ""}</li>
                    <li>{pokeId ? "defense: " + pokeId.defense : ""}</li>
                    <li><img src={ pokeId ? pokeId.imgageUrl : ""}/> </li>
                </ul>
            </div>
        )
    }
}

export default PokemonDetail