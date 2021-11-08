import React from 'react'
import * as Minesweeper from "../minesweeper.js";

export default class Tile extends React.Component {
  constructor(props){
    super(props);
  }

  render(){
    // console.log(this.props.tile)
    let tile = new Minesweeper.Tile(this.props.board, [this.props.i,this.props.j])
    // console.log(tile)
    // console.log(this.props.reactkey)
    return(
        <div>{tile.pos}</div>
    )
  }
}