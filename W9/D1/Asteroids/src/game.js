const Asteroid = require("./asteroid");

function Game(options) {
  const DIM_X = options['DIM_X'] || 400;
  const DIM_Y = options['DIM_Y'] || 400;
  const NUM_ASTEROIDS = options['NUM_ASTEROIDS'] || 5;
  this.asteroids = []
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
  ctx.clearRect();
  this.asteroids.forEach((asteroid) => {
    asteroid.draw();
  }
  );
}

Game.prototype.moveObjects = function() {
  this.asteroids.forEach((asteroid) => {
    asteroid.move();
  }
  );
}