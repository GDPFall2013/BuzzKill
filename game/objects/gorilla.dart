part of gdp;

class Gorilla extends Enemy{
  
  ImageElement img = new ImageElement();

  SpriteSheet sprite;
  SpriteSheet attackSprite;
  SpriteSheet attackSprite1;
  
  
  
  int spriteXInitial = 0;
  int spriteYInitial = 360;
  int spriteWidth = 140;
  int spriteHeight = 200;
  int attacknum;
  
 
  
  double imgOffsetX = 0.0;
  double imgOffsetY = -20.0;

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
    width = 140.0;
    height = 200.0;
    
    sprite = new SpriteSheet("./content/enemies_spritesheet.png",0,360,140,200);
    attackSprite = new SpriteSheet("./content/enemies_attack_spritesheet.png",0,665,220,260);
    attackSprite1 = new SpriteSheet("./content/enemies_attack_spritesheet.png",0,1305,130,220);
    initialPos = x;
    endPos = x-150.0;
    
    sprite.frameChangeRate = 50.0;
    sprite.numberOfFrames = 4;
    
    attackSprite.frameChangeRate = 25.0;
    attackSprite.numberOfFrames = 7;
    
    attackSprite1.frameChangeRate = 25.0;
    attackSprite1.numberOfFrames = 8;
       
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
    
    
    //move gorilla back and forth
    else{
    if (goingBack == false) {
      if(x >= endPos){
        x = x - speed;
      }
      else{
        goingBack = true;
        sprite.spritey = 130;
      }
    }
    else {
      if(x<initialPos){
        x = x + speed;
      }
      else{
        goingBack = false;
        sprite.spritey = 360;
      }
    }
    }
    
    sprite.update(dt);  
    
    if(attack)
    {
      /* if(attackSprite.spritex >= 400){
         attackSprite.spritex =0;}
       else{
         attackSprite.spritex += 200;
       }*/
      
    
      if (attacknum == 0)
      { 
       if(attackSprite.spriteFrame > 6)
       {
        attack = false;
        attackSprite.spritex = 0;
        sprite.spritex = 0;
        attackSprite.spriteFrame = 1;
       }
       else if(goingBack)
       {
         attackSprite.spritey = 285;
         sprite.spritex = -200;
       }
       else
       {
        attackSprite.spritey = 665;
        sprite.spritex = -200;
       } 
       
       attackSprite.update(dt);
     }
     else if (attacknum == 1) 
     {
       if(attackSprite1.spriteFrame > 7)
       {
        attack = false;
        attackSprite1.spritex = 0;
        sprite.spritex = 0;
        attackSprite1.spriteFrame = 1;
       }
       else if(goingBack)
       {
         attackSprite1.spritey = 1305;
         sprite.spritex = -200;
       }
       else
       {
        attackSprite1.spritey = 1544;
        sprite.spritex = -200;
       } 
       
       attackSprite1.update(dt);
    }

   }
  }
  
  draw()
  {
    sprite.drawOnPosition(x-width/2 - imgOffsetX, y-height/2 + imgOffsetY, width , height);
    if(attack)
    {
       if (attacknum == 0)
       {
         attackSprite.drawOnPosition(x-width/2 - imgOffsetX, y-height/2 + (-80), width , height);
       }
       else if (attacknum == 1)
       {
        attackSprite1.drawOnPosition(x-width/2 - imgOffsetX, y-height/2 + (-45), width , height);
       }
    }
  }
  
   double injure() 
   {
    attack = true;
    generateRandomNumbers();
    return 10.0;
   }  
   
   
   
   
   
}