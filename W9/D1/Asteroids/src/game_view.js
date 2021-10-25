module.exports = GameView;
const Game = require("./game.js")

function GameView(ctx) {
  console.log('In game view object')
  this.game = new Game();// Game.call()
  console.log('Created game view object')
  this.context = ctx;
}

GameView.prototype.start = function() {
  setInterval(() => { 
    // debugger
    this.game.moveObjects(this.context); this.game.draw(this.context)
  }, 20);
}

