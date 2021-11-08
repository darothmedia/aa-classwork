import React from "react";
import * as Minesweeper from "../minesweeper.js";
import Board from './board.jsx';

class Game extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      board: new Minesweeper.Board(8, 4)
    }
    this.updateGame = this.updateGame.bind(this);
  }

  updateGame(tile, boolean) {
  
    if (boolean === true) {tile.toggleFlag()}
    else {tile.explore()}
    
    console.log(`${tile.flagged}`)
  }

  render() {
    let board = this.state.board
    // console.log(board)
    return(
    <div>
    <h1>Minesweeper!</h1>
    {/* {this.state.board.map((el) => {

    //   })} */}
      <Board board={board} updateGame={this.updateGame}/>
    </div>
    )
  }
}

export default Game