part of gdp;

class Droid extends Enemy{
  
  ImageElement img = new ImageElement();

  SpriteSheet sprite;
  int spriteXInitial = 0;
  int spriteYInitial = 442;
  int spriteWidth = 78;
  int spriteHeight = 108;
  
  double imgOffsetX = 8.0;
  double imgOffsetY = -4.0;

  double initialPos;
  double endPos;
  bool goingBack = false;
  
  initialize(double x, double y) {
    super.initialize(x, y);
    width = 54.0;
    height = 104.0;
    sprite = new SpriteSheet("./content/enemies_spritesheet copy.png",
        spriteXInitial,spriteYInitial,spriteWidth,spriteHeight);
    
    initialPos = x;
    endPos = x-150.0;
    
    sprite.frameChangeRate = 10.0;
    sprite.numberOfFrames = 8;
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
        sprite.spritey = 550;
      }
    } else {
      if(x<initialPos){
        x = x + speed;
      }
      else{
        goingBack = false;
        sprite.spritey = 442;
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