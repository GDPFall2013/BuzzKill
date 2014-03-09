part of gdp;

class Cyrax extends Enemy{
  
  ImageElement img = new ImageElement();

  SpriteSheet sprite;
  SpriteSheet walkingSprite;
  SpriteSheet flyingSprite;
  
  int spriteXInitial = 110;
  int spriteYInitial = 850;
  int spriteWidth = 110;
  int spriteHeight = 160;
  
  double imgOffsetX = 8.0;
  double imgOffsetY = -7.0;

  double initialPos;
  double endPos;
  bool goingBack = false;
  
  static int enumStateGround = 0;
  static int enumStateHovering = 1;
  static int enumStateFlying = 2;
  
  int state = enumStateGround;
  
  initialize(double x, double y) {
    super.initialize(x, y);
    width = 110.0;
    height = 160.0;
    walkingSprite = new SpriteSheet("./content/enemies_spritesheet.png",
        spriteXInitial,spriteYInitial,spriteWidth,spriteHeight);
    flyingSprite = new SpriteSheet("./content/cyrax_flying_spritesheet.png",
        0,0,300,250);
    
    initialPos = x;
    endPos = x-600.0;
    
    walkingSprite.frameChangeRate = 20.0;
    walkingSprite.numberOfFrames = 4;
    
    flyingSprite.frameChangeRate = 20.0;
    flyingSprite.numberOfFrames = 6;
  }
  
  update (double dt) {
    if (state == enumStateGround) {
      groundUpdate(dt);
    } else if (state == enumStateHovering) {
      hoveringUpdate(dt);
    } else if (state == enumStateFlying){
      flyingUpdate(dt);
    }

    
    sprite.update(dt);  
  }
  
  groundUpdate(double dt) {
    double speed = 0.4 * dt;
    
    //move aliens back and forth
    if (goingBack == false) {
      if(x >= endPos){
        x = x - speed;
      }
      else{
        goingBack = true;
        sprite.spritey = 1010;
      }
    } else {
      if(x<initialPos){
        x = x + speed;
      }
      else{
        goingBack = false;
        sprite.spritey = 850;
      }
    }
  }
  
  hoveringUpdate(double dt) {
    double speed = 0.4 * dt;
    
    //move aliens back and forth
    if (goingBack == false) {
      if(x >= endPos){
        x = x - speed;
      }
      else{
        goingBack = true;
        sprite.spritey = 250;
      }
    } else {
      if(x<initialPos){
        x = x + speed;
      }
      else{
        goingBack = false;
        sprite.spritey = 0;
      }
    }
  }
  
  flyingUpdate(double dt) {
 double speed = 1.0 * dt;
    
    //move aliens back and forth
    if (goingBack == false) {
      if(x >= endPos){
        x = x - speed;
      }
      else{
        goingBack = true;
        sprite.spritey = 1250;
      }
    } else {
      if(x<initialPos){
        x = x + speed;
      }
      else{
        goingBack = false;
        sprite.spritey = 1000;
      }
    }
  }
  
  void changeElevation(int newElevation) {
    switch (newElevation){
    case 0:
      sprite = walkingSprite;
      
      break;
    case 1:
      sprite = flyingSprite;
      
      break;
    case 2:
      sprite = flyingSprite;
      
      break;
    }
  }
  
  draw(){
    sprite.drawOnPosition(x-width/2 - imgOffsetX, y-height/2 + imgOffsetY, width , height);
  }
  
   double injure() {
    return 10.0 * Globals.enemyDamage;
   }
}