part of gdp;

class CyraxMiniShuriken extends Projectile
{
  
  ImageElement img = new ImageElement();
  
  int spriteXInitial = 0; //TODO
  int spriteYInitial = 1040; //TODO
  int spriteWidth = 60; //TODO
  int spriteHeight = 50; //TODO
  
  initialize(double x, double y) 
  {
    super.initialize(x, y);
    width = 60.0; //TODO
    height = 110.0; //TODO
    sprite = new SpriteSheet("./content/cyrax_attack_spritesheet.png",
        spriteXInitial,spriteYInitial,spriteWidth,spriteHeight);
    
    sprite.frameChangeRate = 9.0; //TODO
    sprite.numberOfFrames = 14; //TODO
    
    imgOffsetX = 0.0; //TODO
    imgOffsetY = 0.0; //TODO
    
    injureValue = 5.0;
  }
}