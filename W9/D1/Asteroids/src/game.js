module.exports = Game;
const Asteroid = require("./asteroid");

function Game(options = {}) {
  this.DIM_X = options['DIM_X'] || 400;
  this.DIM_Y = options['DIM_Y'] || 400;
  this.NUM_ASTEROIDS = options['NUM_ASTEROIDS'] || 5;
  this.asteroids = [];
  this.addAsteroids();
}
Game.prototype.randomPosition = function() {
  return { pos: [Math.random() * this.DIM_X, Math.random() * this.DIM_Y]}
}

Game.prototype.addAsteroids = function() {
  for (let i=0;i<this.NUM_ASTEROIDS;i++) {
    this.asteroids.push(new Asteroid(this.randomPosition()))
  }
}

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y); //this.DIM_X, this.DIM_Y
  this.asteroids.forEach((asteroid) => {
    asteroid.draw(ctx);
  }
  );
}

Game.prototype.moveObjects = function(ctx) {
  this.asteroids.forEach((asteroid) => {
    asteroid.move();
    asteroid.draw(ctx);
  }
  );
}