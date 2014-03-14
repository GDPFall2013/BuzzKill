part of gdp;

/**
 * The oxygen class represents the object in the game that Buzz needs to collect
 * To keep his oxygen "Life" from reaching 0.  
 * Oxygen can float in midair and is not affected by gravity
 */
class Oxygen extends Item {
  
  SpriteSheet sprite = new SpriteSheet("./content/gameitems.png",0,0,50,50);
  
  update(double dt){
    // inanimate object, does nothing
  }
  
  initialize(double x, double y) {
    super.initialize(x, y);
    this.width = 50.0;
    this.height = 45.0;
  }
  
  draw() {
    sprite.drawOnPosition(x-this.width/2, y-this.height/2, width , height);
  }
  
  /*
   * This method to be called when Buzz touches the object.  
   */
  collect() {
    Game.oxygen += 2.0;  //TODO this should be changed to a method call
    SoundManager.instance.playSound(SoundManager.enumSoundOxygen);
   this.dead = true;
   print(++Game.instance.oxygenCollected);
  }
}