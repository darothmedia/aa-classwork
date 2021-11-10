import React from "react";
import * as Minesweeper from "../minesweeper.js";
import Board from './board.jsx';

class Game extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      board: new Minesweeper.Board(4, 2)
    }
    this.updateGame = this.updateGame.bind(this);
  }

  updateGame(tile, boolean) {
  
    if (boolean === true) {tile.toggleFlag()}
    else {tile.explore()}
    let x = tile.pos[0]
    let y = tile.pos[1]
    this.state.board.grid[x][y] = tile
    
    console.log('BOARD1',this.state.board)
    this.setState({board: this.state.board})
    this.state.board.lost()
    console.log(this.state.board.lost())

    // if (this.state.board.lost() === true){
    // }
  }

  render() {
    let board = this.state.board
    // console.log(this.state.board.lost())
    // this.state.board.lost()

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