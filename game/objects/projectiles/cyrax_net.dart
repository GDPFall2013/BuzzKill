part of gdp;

class CyraxNet extends Projectile
{
  
  ImageElement img = new ImageElement();
  
  int spriteXInitial = 0; //TODO
  int spriteYInitial = 1040; //TODO
  int spriteWidth = 60;  //TODO
  int spriteHeight = 50; //TODO

  int direction = 1;
  
  initialize(double x, double y) 
  {
    super.initialize(x, y);
    width = 60.0; //TODO
    height = 110.0; //TODO
    sprite = new SpriteSheet("./content/cyrax_attack_spritesheet.png",
        spriteXInitial,spriteYInitial,spriteWidth,spriteHeight); //TODO
    
    imgOffsetX = 0.0; //TODO
    imgOffsetY = 0.0; //TODO
    
    sprite.frameChangeRate = 9.0; //TODO
    sprite.numberOfFrames = 14; //TODO
    
    horizontalVelocity = 1.2;
    verticalVelocity = 0.0;
    
    injureValue = 20.0;
  }
  
  void setDirection(int direction) {
    this.direction = direction;
    if (direction == 1) {
      sprite.spritey = 1160; //TODO
    } else {
      sprite.spritey = 1040; //TODO
      horizontalVelocity *= -1.0;
    }
  }
  
  
   double injure() 
   {
     return 20.0 * Globals.enemyDamage;
   }
}