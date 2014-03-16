part of gdp;

class CyraxNet extends Projectile
{
  int spriteXInitial = 200;
  int spriteYInitial = 720;
  int spriteWidth = 100;  
  int spriteHeight = 180; 
  
  initialize(double x, double y) 
  {
    super.initialize(x, y);
    width = 50.0;
    height = 90.0;
    sprite = new SpriteSheet("./content/cyrax_attack_spritesheet.png",
        spriteXInitial,spriteYInitial,spriteWidth,spriteHeight); //TODO
    
    imgOffsetX = 20.0;
    imgOffsetY = -45.0;
    
    sprite.frameChangeRate = 100.0;
    sprite.numberOfFrames = 1;
    
    horizontalVelocity = 3.0;
    verticalVelocity = 0.0;
    
    injureValue = 20.0;
  }
  
  void setDirection(int direction) {
    if (direction != 1) {
      horizontalVelocity = -4.0;
      sprite.spritey = 900;
    } else {
      horizontalVelocity = 4.0;
      sprite.spritey = 720;
    }
  }
}