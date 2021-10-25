module.exports = Asteroid;
const MovingObject = require("./moving_object");
const { inherits, scale, randomVec } = require("./utils");

function Asteroid(options) {
  this.pos = options["pos"];
  //                dir         length from 0 to 10
  this.vel = scale(randomVec(), Math.random() * 10);
  this.radius = 5;
  this.color = "grey";
}

inherits(Asteroid, MovingObject);