import React from 'react'
import * as Minesweeper from "../minesweeper.js";

export default class Tile extends React.Component {
  constructor(props){
    super(props);
    this.tile = new Minesweeper.Tile(this.props.board, [this.props.i, this.props.j])
    this.handleClick = this.handleClick.bind(this)
    this.bombcount = ""
  }

  render(){
    // console.log(this.props.tile)
    if (this.tile.explored) {this.bombcount = this.tile.adjacentBombCount()}
    else {this.bombcount = "x"}
    // console.log(this.props.reactkey)
    return(
      <button onClick={this.handleClick}>{`${this.bombcount}`}</button>
    )
  }

  handleClick(){
    console.log(this.tile.adjacentBombCount())
    // this.bombcount = this.tile.adjacentBombCount()
    // this.props.updateGame()
    // this.tile.explored = true
    // this.render()
    this.props.updateGame(this.tile, this.tile.explored)
    this.render()
  }

}