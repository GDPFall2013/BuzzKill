part of gdp;

/**
 * A block represents a game object that does not move and the player cannot move through.
 * Ground is the most common use case.
*/
class Block extends GameObject {
  
  initialize(double x, double y) {
    super.initialize(x, y);
  }
  
  // Since this is a block, it should be filled in
  draw() {
    assert(this.height > 0.0);
    assert(this.width > 0.0);
    
    double cx = x - camera.x;
    double cy = y - camera.y;
    context.save();
    context.beginPath(); 
    context.fillStyle = "Grey";
    context.moveTo(cx - this.width/2, cy - this.height/2);
    context.lineTo(cx + this.width/2, cy - this.height/2);
    context.lineTo(cx + this.width/2, cy + this.height/2);
    context.lineTo(cx - this.width/2, cy + this.height/2);
    context.lineTo(cx - this.width/2, cy - this.height/2);
    context.fill();
    context.stroke();
    context.restore();
  }
}