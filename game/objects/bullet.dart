part of gdp;

class Bullet extends Enemy
{
  
  ImageElement img = new ImageElement();
  
  double speed;
  
  SpriteSheet sprite;
  int spriteXInitial = 0;
  int spriteYInitial = 1040;
  int spriteWidth = 60;
  int spriteHeight = 110;
  
  double imgOffsetX = 8.0;
  double imgOffsetY = -7.0;

  double initialPos;
  double endPos;
  bool goingBack = false;
  
  initialize(double x, double y) 
  {
    super.initialize(x, y);
    width = 60.0;
    height = 110.0;
    sprite = new SpriteSheet("./content/enemies_attack_spritesheet.png",
        spriteXInitial,spriteYInitial,spriteWidth,spriteHeight);
    
    initialPos = x;
    endPos = x-600.0;
    
    sprite.frameChangeRate = 9.0;
    sprite.numberOfFrames = 14;
  }
 
  
  update (double dt) 
  {
    speed = 1.2 * dt;
    
   //move bullet back and forth
    if (goingBack == false) 
    {
      if(x >= endPos)
      {
        x = x - speed;   
      }
      else
      {
        goingBack = true;
        sprite.spritey = 1160;
      }    
    } 
    else
    {
      if(x < initialPos)
      {
        x = x + speed;
      }
      else
      {
         goingBack = false;
         sprite.spritey = 1040;
       
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