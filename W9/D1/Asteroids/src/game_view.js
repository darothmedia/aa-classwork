require("game.js")

function GameView(ctx) {
  this.game = new Game();
  this.context = ctx;
}

GameView.prototype.start = function() {
  setInterval(() => { 
    this.game.moveObjects(); this.game.draw(this.context)
  }, 20);
}

