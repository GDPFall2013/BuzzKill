part of gdp;

class Bullet extends Projectile
{
  
  ImageElement img = new ImageElement();
  
  int spriteXInitial = 0;
  int spriteYInitial = 1040;
  int spriteWidth = 60;
  int spriteHeight = 50;
  
  double imgOffsetX = 20.0;
  double imgOffsetY = 0.0;

  int direction = 1;
  
  initialize(double x, double y) 
  {
    super.initialize(x, y);
    width = 22.0;
    height = 10.0;
    sprite = new SpriteSheet("./content/enemies_attack_spritesheet.png",
        spriteXInitial,spriteYInitial,spriteWidth,spriteHeight);
    
    sprite.frameChangeRate = 9.0;
    sprite.numberOfFrames = 14;
    
    horizontalVelocity = 1.2;
    verticalVelocity = 0.0;
    
    injureValue = 10.0;
  }
 
  
  void setDirection(int direction) {
    
    if (direction == 1) {
      sprite.spritey = 1160;
    } else {
      sprite.spritey = 1040;
      horizontalVelocity *= -1.0;
    }
  }
}