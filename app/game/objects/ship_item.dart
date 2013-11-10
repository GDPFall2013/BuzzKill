part of gdp;

/**
 * The ship item is what Buzz needs to collect to pass the level.  It is an object
 * Not affected by Gravity
 */
class ShipItem extends GameObject{
  
  update(double dt) {
    //Inanimate object, does nothing
  }
  
  draw() {
    context.save();
    context.fillStyle = 'black';
    context.fillText("SHIP ITEM", x - camera.x - width/2, y - camera.y, width);
    context.restore();
  }
  
  /*
   * This method to be called when Buzz touches the item
   */
  collect() {
    SoundManager.instance.playSound(SoundManager.enumSoundShipItem);
    // TODO: Trigger End of Level 
  }
}