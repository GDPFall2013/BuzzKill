part of gdp;

class CyraxShuriken extends Projectile
{
  
  ImageElement img = new ImageElement();
  
  int spriteXInitial = 250;
  int spriteYInitial = 90;
  int spriteWidth = 125;
  int spriteHeight = 170;
  
  initialize(double x, double y) 
  {
    super.initialize(x, y);
    width = 50.0;
    height = 50.0;
    sprite = new SpriteSheet("./content/cyrax_attack_spritesheet.png",
        spriteXInitial,spriteYInitial,spriteWidth,spriteHeight);
    
    imgOffsetX = 55.0; //TODO
    imgOffsetY = -50.0; //TODO
    
    sprite.frameChangeRate = 9.0; //TODO
    sprite.numberOfFrames = 8; //TODO
    
    injureValue = 10.0;
  }
  
}