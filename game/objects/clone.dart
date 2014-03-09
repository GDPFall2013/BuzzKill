
part of gdp;

class clone extends Enemy{
  
  ImageElement img = new ImageElement();

  SpriteSheet sprite;
  int spriteXInitial = 0;
  int spriteYInitial = 1338;
  int spriteWidth = 180;
  int spriteHeight = 180;
  
  double imgOffsetX = 8.0;
  double imgOffsetY = -7.0;

  double initialPos;
  double endPos;
  bool goingBack = false;
  
  initialize(double x, double y) {
    super.initialize(x, y);
    width = 180.0;
    height = 180.0;
    sprite = new SpriteSheet("./content/enemies_spritesheet.png",
        spriteXInitial,spriteYInitial,spriteWidth,spriteHeight);
    
    initialPos = x;
    endPos = x-600.0;
    
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
        sprite.spritey = 1560;
      }
    } else {
      if(x<initialPos){
        x = x + speed;
      }
      else{
        goingBack = false;
        sprite.spritey = 1338;
      }
    }
    sprite.update(dt);  
  }
  
  draw()
  {
    sprite.drawOnPosition(x-width/2 - imgOffsetX, y-height/2 + imgOffsetY, width , height);
  }
  
   double injure() 
   {
    return 10.0;
   }
}