part of gdp;



class Alien extends Enemy{
  
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
  
  initialize(double x, double y) {
    super.initialize(x, GROUND_LEVEL);
    width = 83.0;
    height = 40.0;
    //y = GROUND_LEVEL;
    sprite = new SpriteSheet("./content/alienturtle_spritesheet.png",0,0,97,50);
    repeat = 0;
  }
  
  update (double dt) {
  //move increment (assuming aliens will always be moving towards the left)
    x = x - 0.5 * dt;
    
    lastDraw += dt;
    if (lastDraw > 1.0) {
    lastDraw -= 1.0;
      //sprite logic
      if(sprite.spritex >= 380){
        sprite.spritex = 0;
        sprite.spritey = 0;
        
        repeat = 1;
      }
      else if(repeat==1 || repeat==2 || repeat == 3 || repeat ==4){
        sprite.spritex = sprite.spritex;
        sprite.spritey = 0;
        
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
      }
      else{
        sprite.spritex = sprite.spritex + 97;
        sprite.spritey = 0;
        repeat = 1;
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