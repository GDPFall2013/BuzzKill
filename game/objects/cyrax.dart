part of gdp;

class Cyrax extends Enemy{
  
  ImageElement img = new ImageElement();

  SpriteSheet sprite;
  SpriteSheet attacksprite0;
  SpriteSheet attacksprite1;
  SpriteSheet attacksprite2;
  SpriteSheet attacksprite3;
  
  int spriteXInitial = 0;
  int spriteYInitial = 880;
  int spriteWidth = 90;
  int spriteHeight = 170;
  int attacknum;
 
  
  double imgOffsetX = 8.0;
  double imgOffsetY = -7.0;

  double initialPos;
  double endPos;
  bool goingBack = false;
  bool attack = false;
 
  Random rnd = new Random();
  
  
  
  generateRandomNumbers()
  {
    attacknum = rnd.nextInt(3);  
  }
  
  
  initialize(double x, double y) {
    super.initialize(x, y);
    width = 90.0;
    height = 170.0;
    sprite = new SpriteSheet("./content/enemies_spritesheet.png",
        spriteXInitial,spriteYInitial,spriteWidth,spriteHeight);
    attacksprite0 = new SpriteSheet("./content/Cyrax_attack_spritesheet.png",
        0,92,130,200);
    attacksprite1 = new SpriteSheet("./content/Cyrax_attack_spritesheet.png",
        0,730,130,190);
    attacksprite2 = new SpriteSheet("./content/Cyrax_attack_spritesheet.png",
        0,1998,100,190);
    attacksprite3 = new SpriteSheet("./content/Cyrax_attack_spritesheet.png",
        0,1850,160,180);
     
    
    initialPos = x;
    endPos = x-600.0;
    
    sprite.frameChangeRate = 20.0;
    sprite.numberOfFrames = 5;
     
    attacksprite0.frameChangeRate = 100.0;
    attacksprite0.numberOfFrames = 10;
    
    attacksprite1.frameChangeRate = 100.0;
    attacksprite1.numberOfFrames = 8;
    
    attacksprite2.frameChangeRate = 100.0;
    attacksprite2.numberOfFrames = 7;
    
    attacksprite3.frameChangeRate = 100.0;
    attacksprite3.numberOfFrames = 2;
    
    
    TYPE = "BOSS";
    generateRandomNumbers();
    
  }
  
  update (double dt) 
  {
   
    double speed = 0.4 * dt;
    
    //move Cyrax back and forth
    
      if (goingBack == false) 
      {
        if(x >= endPos){
          x = x - speed;
        }
        else{
          goingBack = true;
          sprite.spritey = 1100;
        }
      } else {
        if(x<initialPos){
          x = x + speed;
        }
        else{
          goingBack = false;
          sprite.spritey = 880;
        }
      }
      sprite.update(dt); 
    
     if (attacknum == 0)
    {
      if(attacksprite0.spriteFrame > 9)
      {
        attack = false;
        attacksprite0.spritex = 0;
        sprite.spritex = 0;
        attacksprite0.spriteFrame = 1;
       }
       else if(goingBack)
       {
         attacksprite0.spritey = 416;
         sprite.spritex = -200;
       
       }
       else
       {
        attacksprite0.spritey = 92;
        sprite.spritex = -200;
       } 
       
       attacksprite0.update(dt);
        
    }
       
    else if (attacknum == 1) 
    {
      if(attacksprite1.spriteFrame > 7)
      {
        attack = false;
        attacksprite1.spritex = 0;
        sprite.spritex = 0;
        attacksprite1.spriteFrame = 1;
       }
       else if(goingBack)
       {
         attacksprite1.spritey = 980;
         sprite.spritex = -200;
         
       }
       else
       {
        attacksprite1.spritey = 730;
        sprite.spritex = -200;
       } 
       
       attacksprite1.update(dt);
    }
    else if (attacknum == 2) 
    {
      if(attacksprite2.spriteFrame > 6)
      {
        attack = false;
        attacksprite2.spritex = 0;
        sprite.spritex = 0;
        attacksprite2.spriteFrame = 1;
       }
       else if(goingBack)
       {
         attacksprite2.spritey = 1400;
         sprite.spritex = -200;
         
       }
       else
         
       {
        attacksprite2.spritey = 1200;
        sprite.spritex = -200;
       } 
       
       attacksprite2.update(dt);
    }
   
    
    if(attack)
    {
      if(attacksprite3.spriteFrame > 1)
      {
        attack = false;
        attacksprite3.spritex = 0;
        sprite.spritex = 0;
        attacksprite3.spriteFrame = 1;
       }
       else if(goingBack)
       {
         attacksprite3.spritey = 1620;
         sprite.spritex = -200;
       }
       else
       {
        attacksprite3.spritey = 1850;
        sprite.spritex = -200;
       } 
       attacksprite3.update(dt);
    }
    
  }
  draw()
  {
    sprite.drawOnPosition(x-width/2 - imgOffsetX, y-height/2 + imgOffsetY, width , height);
    if (attacknum == 0)
    {
      attacksprite0.drawOnPosition(x-width/2 - imgOffsetX, y-height/2 + (-80), width , height);
    }
    else if (attacknum == 1)
    
    {
      attacksprite1.drawOnPosition(x-width/2 - imgOffsetX, y-height/2 + (-45), width , height);
    }
    else if (attacknum == 2)
    {
      attacksprite2.drawOnPosition(x-width/2 - imgOffsetX, y-height/2 + (-45), width , height);
    }
    
    if(attack && attacknum == 2)
    {
      attacksprite3.drawOnPosition(x-width/2 - imgOffsetX, y-height/2 + (-80), width , height);
       
    }
  }
  
  
  
   double injure() 
   
   {
     attack = true;
     
     return 10.0;
   }
}