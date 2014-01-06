part of gdp;

/**
 * The oxygen class represents the object in the game that Buzz needs to collect
 * To keep his oxygen "Life" from reaching 0.  
 * Oxygen can float in midair and is not affected by gravity
 */
class Oxygen extends Item {
  
  SpriteSheet sprite = new SpriteSheet("./content/gameitems.png",0,0,50,50);
  SpriteSheet boulder = new SpriteSheet("./content/gameitems.png",50,0,120,100);
  bool collected = false;
  
  update(double dt){
    // inanimate object, does nothing
  }
  
  initialize(double x, double y) {
    super.initialize(x, y);
    this.width = 30.0;
    this.height = 10.0;
  }
  
  draw() {
    /*
    context.save();
    context.beginPath();
    context.fillStyle = 'green';
    context.arc(x - camera.x, y - camera.y,width/2,0,2*PI);
    context.fill();
    context.fillStyle = 'black';
    context.fillText("Oxygen", x - camera.x - width/2, y - camera.y, width);
    context.restore();
    */
    if(collected){
      boulder.drawOnPosition(x-camera.x, y-camera.y, 120.0 , 100.0);  
    }
    else{
    sprite.drawOnPosition(x-camera.x, y-camera.y, width , height);
    }
  }
  
  /*
   * This method to be called when Buzz touches the object.  
   */
  collect() {
    collected = true;
    boulder.drawOnPosition(x-camera.x, y-camera.y, 120.0 , 100.0);
    Game.oxygen += 2.0;  //TODO this should be changed to a method call
    SoundManager.instance.playSound(SoundManager.enumSoundOxygen);
   this.dead = true;
  }
}