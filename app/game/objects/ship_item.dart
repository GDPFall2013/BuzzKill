part of gdp;

/**
 * The ship item is what Buzz needs to collect to pass the level.  It is an object
 * Not affected by Gravity
 */
class ShipItem extends Item{
  
  update(double dt) {
    //Inanimate object, does nothing
  }
  
  draw() {
    context.save();
    context.beginPath();
    context.fillStyle = 'brown';
    context.strokeStyle = 'black';
    
    double cx = this.x - camera.x;
    double cy = this.y - camera.y;
    
    context.moveTo(cx - this.width/2, cy - this.height/2);
    context.lineTo(cx + this.width/2, cy - this.height/2);
    context.lineTo(cx + this.width/2, cy + this.height/2);
    context.lineTo(cx - this.width/2, cy + this.height/2);
    context.lineTo(cx - this.width/2, cy - this.height/2);
 
    
    context.stroke();
    context.fill();
    context.fillStyle = 'black';
    context.fillText("Ship Item", x - camera.x - width/2, y - camera.y, width);
    context.restore();
  }
  
  /*
   * This method to be called when Buzz touches the item
   */
  collect() {
    SoundManager.instance.playSound(SoundManager.enumSoundShipItem);
    Game.instance.win();
  }
}