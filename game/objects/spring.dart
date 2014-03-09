part of gdp;

/**
 * The oxygen class represents the object in the game that Buzz needs to collect
 * To keep his oxygen "Life" from reaching 0.  
 * Oxygen can float in midair and is not affected by gravity
 */
class Spring extends Block {
  
  SpriteSheet sprite = new SpriteSheet("./content/gameitems copy.png",0,0,74,165);
  bool onSpring = false;
  bool once = false; bool jump = false;
  int repeat = 0;
  double originalY;
  double oldPlayerY;
  MovingBlock movingBlock;
  
  update(double dt){
    if(onSpring){
      sprite.spritex = 74;
      onSpring = false;
      //Game.instance.player.y = this.y - 44;
      once = true;
      sprite.spritey = 269;
      this.y = originalY + 77;
    }
    else if(once){
      sprite.spritex = 148;

      sprite.spritey = 193;
      this.y = originalY;
     // Game.instance.player.y = oldPlayerY;
      
      
 //     Game.instance.player.y = -20.0;
      if(!jump){
      //Game.instance.player.y = -220.0;
      //Game.instance.player.x += 1;
      Game.instance.player.SPRING_JUMP = true;
      jump = true;
      SoundManager.instance.playSound(SoundManager.enumSoundSpring);
      }
      
      if(repeat < 20){
        repeat++;
       // Game.instance.player.y = -50.0;
      }
      else{
        repeat = 0;
        once = false;
        jump = false;
      }
      
    }
    else{
      sprite.spritex = 0;
      this.y = originalY;
    }
    
    
    
    if(movingBlock != null){
      if(movingBlock.goingBack){
              this.x -= movingBlock.speedX;}
             else{
               this.x += movingBlock.speedX;
             }
    }
    
  }
  
  initialize(double x, double y) {
    super.initialize(x, y);
    this.width = 74.0;
    this.height = 165.0;
    sprite.spritey = 193;
    spring = true;
    originalY = y;
  }
  
  draw() {
    sprite.drawOnPosition(x-this.width/2, y-this.height/2, width , height);
    
  }
  
  
  setOnSpring(bool os){
    onSpring = os;
  }
  
  
}