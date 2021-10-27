class View {
  constructor(game, el) {}

  setupBoard() {
    // // const ttt = document.getElementsByClassName('ttt')
    // let grid = document.createElement('div')
    // // let rows = document.getElementsByClassName('gridRow')
    // for (let i = 0; i < 3; i++) {
    //   let row = document.createElement('ul');
    //   grid.appendChild(row).className = 'gridRow'

    //   for (let j = 0; j < 3; j++) {
    //   let cell = document.createElement('li')
    //   row.appendChild(cell).className = 'cell'
    //   debugger
    //     // `${i, j}`
    //   }
    // }

    game.board.grid.forEach((cell) => {
      
    })
  }
  
  bindEvents() {}

  handleClick(e) {}

  makeMove(square) {}

}



module.exports = View;
