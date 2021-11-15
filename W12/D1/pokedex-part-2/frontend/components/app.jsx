import { Route } from 'react-router-dom'
import React from 'react'
import PokemonIndexContainer from './../components/pokemon/pokemon_index_container';

const App = () => (
    <Route path="/" component={PokemonIndexContainer} />
)

export default App