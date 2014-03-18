
part of gdp;

class Predator extends Enemy
{
  
  ImageElement img = new ImageElement();

  SpriteSheet sprite;
  SpriteSheet attackSprite;
  SpriteSheet attackSprite1;

  
  int spriteXInitial = 0;
  int spriteYInitial = 1825;
  int spriteWidth = 180;
  int spriteHeight = 220;
  int attacknum;
  
 
  
  double imgOffsetX = 10.0;
  double imgOffsetY = -10.0;

  double initialPos;
  double endPos;
  bool goingBack = false;
  
  
  bool triggerFall = false;
  bool attack = false;
  
  Random rnd = new Random();
  
  generateRandomNumbers()
  { 
    attacknum = rnd.nextInt(2);   
  }
  
 
  initialize(double x, double y) {
    super.initialize(x, y);
    width = 180.0;
    height = 220.0;
    
    sprite = new SpriteSheet("./content/enemies_spritesheet.png",0,1825,180,220);
    attackSprite = new SpriteSheet("./content/Predator_attack_spritesheet.png",0,305,200,240);
    attackSprite1 = new SpriteSheet("./content/Predator_attack_spritesheet.png",0,830,160,600);
    
    initialPos = x;
    endPos = x-300.0;
    
    sprite.frameChangeRate = 50.0;
    sprite.numberOfFrames = 6;
    
    attackSprite.frameChangeRate = 60.0;
    attackSprite.numberOfFrames = 4;
    
    attackSprite1.frameChangeRate = 60.0;
    attackSprite1.numberOfFrames = 12;
    
       
     TYPE = "BOSS";
     
     
  }
  
  update (double dt) 
  {
    double speed = 0.4 * dt;
    
    if(triggerFall)
    {
      y += 1;
      sprite.spritey = 130;
      
      /*
      if (sprite.lastDraw > sprite.frameChangeRate) {
          sprite.lastDraw -= sprite.frameChangeRate;
            if (sprite.spriteFrame >= sprite.numberOfFrames) {  
              sprite.spriteFrame = 1;
            }
            else{
              sprite.spriteFrame++;
            }
            // The minus one is because the first frame starts at 0
            if(sprite.spritex!=378 && sprite.spritex!=504 && sprite.spritex!=630){
                 sprite.spritex = 378;}
                 else{
                   if(sprite.spritex == 630){
                     sprite.spritex = 378;
                   }
                   else{
                     sprite.spritex += 126;
                   }
                 }
          }
      */
    }
    
    
    //move Predator back and forth
    
    else if (attacknum == 0)
    {
      
      if (goingBack == false) 
      {
        if(x >= endPos)
        {
          x = x - speed;
        }
        else
        {
          goingBack = true;
          sprite.spritey = 2073;
        }
       }
       else 
       {
        if(x<initialPos)
        {
          x = x + speed;
        }
        else
        {
          goingBack = false;
          sprite.spritey = 1825;
        }
      }
      
      sprite.update(dt);
     
    }
    if(attacknum == 1)
    {
     
      if(goingBack == false) 
      {
        if(x >= endPos)
        {
          x = x - speed;
        }
        else
        {
          goingBack = true;
          attackSprite1.spritey = 1872;
        }
       }
       else 
       {
        if(x<initialPos)
        {
          x = x + speed;
        }
        else
        {
          goingBack = false;
          attackSprite1.spritey = 830;
        }
      }
      attackSprite1.update(dt);  
      
    }
    else if (!STATIONARY)
    {
      if(goingBack == false) 
      {
        if(x >= endPos)
        {
          x = x - speed;
        }
        else
        {
          goingBack = true;
          sprite.spritey = 2073;
        }
       }
       else 
       {
        if(x<initialPos)
        {
          x = x + speed;
        }
        else
        {
          goingBack = false;
          sprite.spritey = 1825;
        }
      }
     
    }
    
    sprite.update(dt);
    
 
    if(attack)
    {
      
       if(attackSprite.spriteFrame > 3)
       {
        attack = false;
        attackSprite.spritex = 0;
        sprite.spritex = 0;
        attackSprite.spriteFrame = 1;
       }
       else if(goingBack)
       {
         attackSprite.spritey = 22;
         sprite.spritex = -200;
       }
       else
       {
        attackSprite.spritey = 305;
        sprite.spritex = -200;
       } 
       attackSprite.update(dt);
     }
     
    }

     

  
  draw()
  {
    sprite.drawOnPosition(x-width/2 - imgOffsetX, y-height/2 + imgOffsetY - 20,  width , height);
    if (attacknum == 0)
    {
     sprite.drawOnPosition(x-width/2 - imgOffsetX, y-height/2 + imgOffsetY - 20,  width , height);
    }
    if (attacknum == 1)
    {
     attackSprite1.drawOnPosition(x-width/2 - imgOffsetX, y-height/2 + (-400), width , height);
    }
    
    if(attack)
    {
     
       attackSprite.drawOnPosition(x-width/2 - imgOffsetX, y-height/2 + (-55), width , height);
       
    }
  
   double injure() 
   {
     attack = true;
     generateRandomNumbers();
     return 10.0;
   }  
   
}  
