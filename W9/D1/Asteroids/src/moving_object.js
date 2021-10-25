module.exports = MovingObject;

function MovingObject(options) {
  this.pos = options["pos"] || [0,0];
  this.vel = options["vel"] || [1,1];
  this.radius = options["radius"] || 5;
  this.color = options["color"] || "black";
}

MovingObject.prototype.draw = function (ctx) {
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
  this.pos = [
    this.pos[0] + this.vel[0],
    this.pos[1] + this.vel[1]
  ];
}

