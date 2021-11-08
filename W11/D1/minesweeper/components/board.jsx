import React from 'react'
import Tile from './tile.jsx'
import * as Minesweeper from "../minesweeper.js";

export default class Board extends React.Component{
  constructor(props){
    super(props);
    this.state = {
      // tile: new Minesweeper.Tile()
    }
  }

  render(){
    // let tile = new Minesweeper.Tile()
    // console.log(tile)
    return (
      <div className="board-div">
        {this.props.board.grid.map((row, i) => {
          return <div className="grid-row" key={i}>
            {row.map((space, j) => {
              return (
              // <div className={[i, j]} key={j}>
                <Tile key={j} j={j} i={i} board={this.props.board} tile={space} updateGame={this.props.updateGame} />)
              // </div>
            })}
          </div>
        })}
      </div>
    );
  }
}