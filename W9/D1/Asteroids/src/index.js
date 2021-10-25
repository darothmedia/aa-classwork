document.addEventListener("DOMContentLoaded", function () {

  const MovingObject = require("./moving_object.js");
  const Canvas = document.getElementById("game-canvas");
  const ctx = Canvas.getContext("2d");
  let circle = new MovingObject({ pos:  [1,2],
                                  radius: 200,
                                  color: "black"});
  
  // ctx.render();
  circle.draw(ctx);
  
  window.MovingObject = MovingObject;
  
  console.log("Webpack is working!");
});
