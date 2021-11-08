import React from "react";
import * as Minesweeper from "../minesweeper.js"

class Game extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      board: new Minesweeper.Board(4, 4)
    }
  }

  updateGame() {

  }

  render() {
    return(
    <div>
      Hello
      {/* {this.state.board.map((el) => {

      })} */}
    </div>
    )
  }
}

export default Game