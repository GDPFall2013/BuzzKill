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
    double cx = this.x - camera.x;
    double cy = this.y - camera.y;
    
    double left = cx - width/2;
    double bottom = cy + height/2;
    double top = cy - height/2;
    
    
    context.save();
    context.beginPath();
    context.moveTo(left, bottom);
    context.lineTo(left + 1 * width/10, top);
    context.lineTo(left + 2 * width/10, bottom);
    context.lineTo(left + 3 * width/10, top);
    context.lineTo(left + 4 * width/10, bottom);
    context.lineTo(left + 5 * width/10, top);
    context.lineTo(left + 6 * width/10, bottom);
    context.lineTo(left + 7 * width/10, top);
    context.lineTo(left + 8 * width/10, bottom);
    context.lineTo(left + 9 * width/10, top);
    context.lineTo(left + 10 * width/10, bottom);
    context.fillStyle = 'maroon';
    context.stroke();
    context.fill();
    context.restore();
  }
  
  injureBuzz() {
    // TODO: Call Method in Player that he's been hurt by X amount
  }
  
}