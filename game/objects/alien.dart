part of gdp;

class Alien extends Enemy{
  
  ImageElement img = new ImageElement();

  SpriteSheet sprite;
  int spriteXInitial = 0;
  int spriteYInitial = 0;
  int spriteWidth = 97;
  int spriteHeight = 50;
  
  double imgOffsetX = 8.0;
  double imgOffsetY = -7.0;

  double initialPos;
  double endPos;
  bool goingBack = false;
  double velocity_y = 20.0;
  double jumpVelocity = 20.0;
  double accel = 0.8;
  double initialY;
  Stopwatch timer = new Stopwatch();
  initialize(double x, double y) {
    super.initialize(x, y);
    width = 83.0;
    height = 40.0;

    sprite = new SpriteSheet("./content/enemies_spritesheet.png",
        spriteXInitial,spriteYInitial,spriteWidth,spriteHeight);
    
    initialPos = x;
    endPos = x-150.0;
    
    sprite.frameChangeRate = 10.0;
    sprite.numberOfFrames = 4;
    
    initialY= y;
  }
  
  update (double dt) {
  
    double speed = 0.4 * dt;
    
    
    if(STATIONARY && JUMP){
      jump(dt);
    }
    
    //move aliens back and forth
    else{
      if (goingBack == false) {
      if(x >= endPos){
        x = x - speed;
      }
      else{
        goingBack = true;
        sprite.spritey = 50;
      }
      
    } else {
      if(x<initialPos){
        x = x + speed;
      }
      else{
        goingBack = false;
        sprite.spritey = 0;
      }
    }
      
      if(JUMP){
        jump(dt);
      }
    }
    
    
    sprite.update(dt);
  }
  
  draw(){
    sprite.drawOnPosition(x-width/2 - imgOffsetX, y-height/2 + imgOffsetY, width , height);
  }
  
   double injure() {
    return 10.0 * Globals.enemyDamage;
   }
   
   
   jump(dt){
     //start jump timer
     if(!timer.isRunning){
       timer.start();
     }
     //Gravity
      if(velocity_y > - 20.0){
        
         velocity_y = velocity_y - accel* (dt);
         y = y - velocity_y * dt;
         if(y>=initialY){
           velocity_y = -21.0;
         }
      }
      else{
        //interval between jumps
        if(timer.elapsedMilliseconds > 1500){
         velocity_y = 20.0;
         timer.reset();
        }
        
        y = initialY;
      }
      
      //print("Y:$y" " Velocity:$velocity_y");
   }
   
}
