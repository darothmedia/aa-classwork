import React from "react";
import * as Minesweeper from "../minesweeper.js";
import Board from './board.jsx';

class Game extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      board: new Minesweeper.Board(4, 4)
    }
    this.updateGame = this.updateGame.bind(this);
  }

  updateGame() {

  }

  render() {
    let board = this.state.board
    console.log(board)
    return(
    <div>
    Hello
    {/* {this.state.board.map((el) => {

    //   })} */}
      <Board board={board} updateGame={this.updateGame}/>
    </div>
    )
  }
}

export default Game