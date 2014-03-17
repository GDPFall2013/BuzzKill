part of gdp;

class CyraxMiniShuriken extends Projectile
{
  
  int spriteXInitial = 200; 
  int spriteYInitial = 360; 
  int spriteWidth = 100; 
  int spriteHeight = 180; 
  
  static double speed = 3.0;
  
  initialize(double x, double y) 
  {
    super.initialize(x, y);
    width = 30.0; 
    height = 25.0;
    sprite = new SpriteSheet("./content/cyrax_attack_spritesheet.png",
        spriteXInitial,spriteYInitial,spriteWidth,spriteHeight);
    
    sprite.frameChangeRate = 9.0;
    sprite.numberOfFrames = 3; 
    
    imgOffsetX = 40.0;
    imgOffsetY = -78.0;
    
    injureValue = 5.0;
  }
}