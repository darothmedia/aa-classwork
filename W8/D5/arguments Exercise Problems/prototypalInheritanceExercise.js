Function.prototype.inherits = function(SuperClass) {
  function Surrogate() {};
  Surrogate.prototype = SuperClass.prototype;
  this.prototype = new Surrogate();
  this.prototype.contructor = this;
}

class MovingObject {
  move() {
    console.log('moving!');
  }
}

class Ship extends MovingObject {
}
// Ship.inherits(MovingObject);

class Asteroid extends MovingObject {}
// Asteroid.inherits(MovingObject);

let enterprise = new Ship;
let cheeseBall = new Asteroid;

console.log(enterprise);
enterprise.move();
cheeseBall.move();
