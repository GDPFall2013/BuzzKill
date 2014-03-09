part of gdp;

class Gorilla extends Enemy{
  
  ImageElement img = new ImageElement();

  SpriteSheet sprite;
  SpriteSheet attackSprite;
  int spriteXInitial = 0;
  int spriteYInitial = 360;
  int spriteWidth = 140;
  int spriteHeight = 200;
  
  double imgOffsetX = 0.0;
  double imgOffsetY = -20.0;

  double initialPos;
  double endPos;
  bool goingBack = false;
  
  
  bool triggerFall = false;
  bool attack = false;
  
  initialize(double x, double y) {
    super.initialize(x, y);
    width = 140.0;
    height = 200.0;
    
    sprite = new SpriteSheet("./content/enemies_spritesheet.png",0,360,140,200);
    attackSprite = new SpriteSheet("./content/enemies_attack_spritesheet.png",0,500,240,250);
    initialPos = x;
    endPos = x-150.0;
    
    sprite.frameChangeRate = 50.0;
    sprite.numberOfFrames = 4;
    
    attackSprite.frameChangeRate = 25.0;
    attackSprite.numberOfFrames = 7;
        
     TYPE = "BOSS";
  }
  
  update (double dt) {
    double speed = 0.4 * dt;
    
    if(triggerFall){
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
    
    if(attack){
      /* if(attackSprite.spritex >= 400){
         attackSprite.spritex =0;}
       else{
         attackSprite.spritex += 200;
       }*/
      if(attackSprite.spriteFrame > 6){
        attack = false;
        attackSprite.spritex = 0;
        sprite.spritex = 0;
        attackSprite.spriteFrame = 1;
        }
      else{
      if(goingBack){
        attackSprite.spritey = 250;
        sprite.spritex = -200;
      }
      else{
        attackSprite.spritey = 500;
        sprite.spritex = -200;
      }
      attackSprite.update(dt);
    }
    }
  }
  
  draw(){
    sprite.drawOnPosition(x-width/2 - imgOffsetX, y-height/2 + imgOffsetY, width , height);
    if(attack){
    attackSprite.drawOnPosition(x-width/2 - imgOffsetX, y-height/2 + (-100), width , height);
    }
  }
  
   double injure() {
    attack = true;
    gameLoop.addTimer((reload) => SoundManager.instance.playSound(SoundManager.enumSoundGSmash), 0.5);
    ;
    return 10.0 * Globals.enemyDamage;
   }
}