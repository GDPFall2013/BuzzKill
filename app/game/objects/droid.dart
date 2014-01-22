part of gdp;



class Droid extends Enemy{
  
  ImageElement img = new ImageElement();

  Input input;
  bool JUMPING = false;
  double velocity_y = 0.0;
  double accel = 10.0;
  static double GROUND_LEVEL = 300.0;
  SpriteSheet sprite;
  int repeat = 0;
  
  double imgOffsetX = 8.0;
  double imgOffsetY = -7.0;
  double lastDraw = 0.0;  // Used for timing Animation
  double initialPos;
  double endPos;
  bool goingBack = false;
  
  initialize(double x, double y) {
    super.initialize(x, y);
    width = 115.0;
    height = 160.0;
    //y = GROUND_LEVEL;
    sprite = new SpriteSheet("./content/enemies_spritesheet.png",0,430,115,160);
    repeat = 0;
    
    initialPos = x;
    endPos = x-150.0;
  }
  
  update (double dt) {
  
    //move aliens back and forth
    if(x >= endPos && goingBack==false){
      x = x - 0.2 * dt;
    }
    else{
      goingBack = true;
      x = x + 0.2 * dt;
    }
    
    if(x<initialPos && goingBack){
      x = x + 0.2 * dt;
    }
    else{
      goingBack = false;
      x = x - 0.2 * dt;
    }
    
    
    
    lastDraw += dt;
    if (lastDraw > 1.0) {
    lastDraw -= 1.0;
      //sprite logic
      if(sprite.spritex >= 920){
        sprite.spritex = 0;
        sprite.spritey = 430;
        
        repeat = 1;
      }
      
      //repeating a single sprite for smoother animation
      else if(repeat==1 || repeat==2 || repeat == 3 || repeat ==4 || repeat ==5
              || repeat==6 || repeat==7 || repeat==8){
        sprite.spritex = sprite.spritex;
        
        if(goingBack){
          sprite.spritey = 590;
        }
        else
        sprite.spritey = 430;
        
        if(repeat == 1){
          repeat = 2;
        }
        else if(repeat == 2){
          repeat = 3;
        }
        else if(repeat == 3){
          repeat = 4;
        }
        else if(repeat == 4){
          repeat = 5;
        }
        else if(repeat == 5){
          repeat = 6;
        }
        else if(repeat == 6){
          repeat = 7;
        }
        else if(repeat == 7){
          repeat = 8;
        }
        else if(repeat == 8){
          repeat = 9;
        }
      }
      else{
        //walking backwards animation
        if(goingBack){
          sprite.spritex = sprite.spritex + 115;
          sprite.spritey = 590;
          repeat = 1;
        }
        //walking forward animation
        else{
        sprite.spritex = sprite.spritex + 115;
        sprite.spritey = 430;
        repeat = 1;
        }
      }
    }
  }
  
   draw(){

     double cx = this.x - camera.x;
     double cy = this.y - camera.y;
     
    sprite.drawOnPosition(cx-width/2 - imgOffsetX, cy-height/2 + imgOffsetY, width , height);
     
    //context.drawImageScaled(img, cx - width/2, cy - height/2, width, height);

  }
  
   double injure() {
    return 10.0;
   }
}