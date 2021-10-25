module.exports = MovingObject;
require("./game.js")

function MovingObject(options) {
  this.pos = options["pos"];
  this.vel = options["vel"];
  this.radius = options["radius"];
  this.color = options["color"];
  this.game = options["game"];
}

MovingObject.prototype.draw = function (ctx) {
  // debugger
  ctx.fillStyle = this.color;
  ctx.beginPath();

  ctx.arc(
    this.pos[0],
    this.pos[1],
    this.radius,
    0,            // start angle radians
    2 * Math.PI,  // end angle radians
    false         // counterclockwise?
  );

  ctx.fill();
}

MovingObject.prototype.move = function() {
  // debugger
  return [
    this.pos[0] + this.vel[0],
    this.pos[1] + this.vel[1]
  ];
}

