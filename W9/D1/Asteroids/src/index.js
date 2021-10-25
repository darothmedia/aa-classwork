document.addEventListener("DOMContentLoaded", function () {
  
  const MovingObject = require("./moving_object.js");
  const Asteroid = require("./asteroid.js");
  const GameView = require("./game_view.js");
  const Canvas = document.getElementById("game-canvas");
  const ctx = Canvas.getContext("2d");
  let circle = new MovingObject({ pos:  [1,2],
                                  radius: 20,
                                  color: "black"});
  let asteroid = new Asteroid({ pos: [10,20]});
  let gv = new GameView(ctx);
  // console.log()
  gv.start();
  // ctx.render();
  circle.draw(ctx);
  asteroid.draw(ctx);
  
  window.MovingObject = MovingObject;
  
  console.log("Webpack is working!");
});
