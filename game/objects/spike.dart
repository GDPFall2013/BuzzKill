part of gdp;

/**
 *  The spike is an object in the game that is immobile and hurts Buzz if he 
 *  touches it
 */
class Spike extends Enemy {
  double damage = 10.0;
  
  update(double dt) {
    //inanimate object, does nothing
  }
  
  draw() {
    
    double left = x - width/2;
    double bottom = y + height/2;
    double top = y - height/2;
    
    
    ctx.save();
    ctx.beginPath();
    ctx.moveTo(left, bottom);
    ctx.lineTo(left + 1 * width/10, top);
    ctx.lineTo(left + 2 * width/10, bottom);
    ctx.lineTo(left + 3 * width/10, top);
    ctx.lineTo(left + 4 * width/10, bottom);
    ctx.lineTo(left + 5 * width/10, top);
    ctx.lineTo(left + 6 * width/10, bottom);
    ctx.lineTo(left + 7 * width/10, top);
    ctx.lineTo(left + 8 * width/10, bottom);
    ctx.lineTo(left + 9 * width/10, top);
    ctx.lineTo(left + 10 * width/10, bottom);
    normContext.fillStyle = 'yellow';
    normContext.closePath();
    ctx.stroke();
    ctx.fill();
    
    ctx.restore();
   
  }
  
  double injure() {
    return 20.0;
  }
  
}