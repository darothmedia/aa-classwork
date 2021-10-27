const View = require ('./ttt-view.js')
const Game = require ('../ttt_node/game.js')
const newGame = new Game();
const newView = new View();

document.addEventListener("DOMContentLoaded", () => {
  const figure = document.getElementsByClassName('ttt')

  newView.setupBoard();
});


