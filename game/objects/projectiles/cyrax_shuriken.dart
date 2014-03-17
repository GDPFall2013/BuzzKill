part of gdp;

class CyraxShuriken extends Projectile
{
  int spriteXInitial = 200;
  int spriteYInitial = 240;
  int spriteWidth = 100;
  int spriteHeight = 60;
  
  initialize(double x, double y) 
  {
    super.initialize(x, y);
    width = 50.0;
    height = 50.0;
    sprite = new SpriteSheet("./content/cyrax_attack_spritesheet.png",
        spriteXInitial,spriteYInitial,spriteWidth,spriteHeight);
    
    imgOffsetX = 30.0;
    imgOffsetY = -3.0;
    
    sprite.frameChangeRate = 8.0;
    sprite.numberOfFrames = 4;
    
    horizontalVelocity = 7.0;
    verticalVelocity = 0.0;
    
    injureValue = 10.0;
  }
  
  void setDirection(int direction) {
    if (direction != 1) {
      horizontalVelocity = -7.0;
    } else {
      horizontalVelocity = 7.0;
    }
  }
}