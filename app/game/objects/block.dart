part of gdp;

/**
 * A block represents a game object that does not move and Alfred cannot move through.
 * Ground is the most common use case.
*/
class Block extends GameObject {
  
  initialize(double x, double y) {
    super.initialize(x, y);
    this.height = 30.0;
    this.width = 1000.0;
  }
  
  // Since this is a block, it should be filled in
  draw() {
    assert(this.height > 0.0);
    assert(this.width > 0.0);
    
    context.save();
    context.beginPath(); 
    context.fillStyle = "Grey";
    context.moveTo(x - this.width/2, y - this.height/2);
    context.lineTo(x + this.width/2, y - this.height/2);
    context.lineTo(x + this.width/2, y + this.height/2);
    context.lineTo(x - this.width/2, y + this.height/2);
    context.lineTo(x - this.width/2, y - this.height/2);
    context.fill();
    context.stroke();
    context.restore();
  }
}