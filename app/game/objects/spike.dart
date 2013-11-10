part of gdp;

/**
 *  The spike is an object in the game that is immobile and hurts Buzz if he 
 *  touches it
 */
class Spike extends GameObject {
  double damage = 10.0;
  
  update(double dt) {
    //inanimate object, does nothing
  }
  
  draw() {
    context.save();
    context.fillStyle = 'black';
    context.fillText("SPIKE", x - camera.x - width/2, y - camera.y, width);
    context.restore();
  }
  
  injureBuzz() {
    // TODO: Call Method in Player that he's been hurt by X amount
  }
  
}