part of gdp;

class Gorilla extends Enemy{
  
  ImageElement img = new ImageElement();

  SpriteSheet sprite;
  int spriteXInitial = 0;
  int spriteYInitial = 266;
  int spriteWidth = 126;
  int spriteHeight = 166;
  
  double imgOffsetX = 8.0;
  double imgOffsetY = -7.0;

  double initialPos;
  double endPos;
  bool goingBack = false;
  
  initialize(double x, double y) {
    super.initialize(x, y);
    width = 126.0;
    height = 166.0;
    
    sprite = new SpriteSheet("./content/enemies_spritesheet copy.png",0,266,126,166);
    
    initialPos = x;
    endPos = x-150.0;
    
    sprite.frameChangeRate = 50.0;
    sprite.numberOfFrames = 6;
  }
  
  update (double dt) {
    double speed = 0.4 * dt;
    
    //move aliens back and forth
    if (goingBack == false) {
      if(x >= endPos){
        x = x - speed;
      }
      else{
        goingBack = true;
        sprite.spritey = 100;
      }
    } else {
      if(x<initialPos){
        x = x + speed;
      }
      else{
        goingBack = false;
        sprite.spritey = 266;
      }
    }
    sprite.update(dt);  
  }
  
  draw(){
    sprite.drawOnPosition(x-width/2 - imgOffsetX, y-height/2 + imgOffsetY, width , height);
  }
  
   double injure() {
    return 10.0;
   }
}