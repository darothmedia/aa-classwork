import { Route, Switch } from 'react-router-dom'
import React from 'react'
import PokemonIndexContainer from './../components/pokemon/pokemon_index_container';
import PokemonDetailContainer from './../components/pokemon/pokemon_details_container';

const App = () => (
    <div>  
    <Switch>
    <Route path="/" component={PokemonIndexContainer} />
    <Route path="/pokemon" component={PokemonDetailContainer} />
    </Switch>
    </div>
)

export default App