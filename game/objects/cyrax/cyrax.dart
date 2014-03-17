part of gdp;

class Cyrax extends Enemy{
  
  ImageElement img = new ImageElement();

  SpriteSheet walkingSprite;
  CyraxAttack currentAttack;
  CyraxAttack netAttack = new NetAttack();
  CyraxAttack shurikenAttack = new ShurikenAttack();
  CyraxAttack miniShurikenAttack = new MiniShurikenAttack();
  
  int spriteXInitial = 0;
  int spriteYInitial = 880;
  int spriteWidth = 90;
  int spriteHeight = 170;
  
  double imgOffsetX = 0.0;
  double imgOffsetY = -10.0;

  double initialPos;
  double endPos;
  bool goingBack = false;
  bool attacking = false;
 
  Random rnd = new Random();
  
  double lastShot = 150.0;
  double shotDelay = 200.0;
  
  initialize(double x, double y) {
    super.initialize(x, y);
    width = 90.0;
    height = 150.0;
    walkingSprite = new SpriteSheet("./content/enemies_spritesheet.png",
        spriteXInitial,spriteYInitial,spriteWidth,spriteHeight);  
    
    initialPos = x;
    endPos = x-600.0;
    
    walkingSprite.frameChangeRate = 20.0;
    walkingSprite.numberOfFrames = 5;
    
    
    TYPE = "BOSS";
    
//    attack();  //For testing
  }
  
  update (double dt) 
  {
    lastShot += dt;
    if (lastShot > shotDelay) {
      lastShot -= shotDelay;
      generateRandomAttack();
    }
    
   if (!attacking) {
    double speed = 0.8 * dt;
    
    //move Cyrax back and forth
    
      if (goingBack == false) 
      {
        if(x >= endPos){
          x = x - speed;
        }
        else{
          goingBack = true;
          walkingSprite.spritey = 1100;
        }
      } else {
        if(x<initialPos){
          x = x + speed;
        }
        else{
          goingBack = false;
          walkingSprite.spritey = 880;
        }
      }
      walkingSprite.update(dt); 
   }
    
  }
  draw()
  {
    if (!attacking) {
      walkingSprite.drawOnPosition(x-width/2 - imgOffsetX, y-height/2 + imgOffsetY, width , height);
    } else {
      currentAttack.draw(x, y, width, height);
    }
  }
  
  generateRandomAttack()
  {
    int attackNum = rnd.nextInt(2); 
    switch (attackNum) {
      case 0: 
        currentAttack = netAttack;
        gameLoop.addTimer((finish) => finishAttack(), currentAttack.totalAttackTime);
      break;
      case 1: 
        currentAttack = shurikenAttack;
        gameLoop.addTimer((finish) => finishAttack(), currentAttack.totalAttackTime);
      break;
      case 2:
        currentAttack = miniShurikenAttack;
        gameLoop.addTimer((finish) => finishAttack(), currentAttack.totalAttackTime);
      break;
    }
    
    int direction;
    if (goingBack) {
      direction = -1;
    } else {
      direction = 1;
    }
    attacking = true;
    currentAttack.fire(x, y, -direction);
  }
  
//  //THis is a function for testing
//  attack(){
//    attacking = true;
//    currentAttack = miniShurikenAttack;
//    
//    int direction;
//    if (goingBack) {
//      direction = -1;
//    } else {
//      direction = 1;
//    }
//    currentAttack.fire(x, y, -direction);
//    gameLoop.addTimer((finish) => finishAttack(), currentAttack.totalAttackTime);
//    
//  }
  
  finishAttack(){
    attacking = false;
   // attack();  // This is here for testing only
  }
  
   double injure() 
   {   
     return 10.0;
   }
}