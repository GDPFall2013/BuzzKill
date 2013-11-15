part of gdp;



class Player extends GameObject{
  
  ImageElement img = new ImageElement();

  Input input;
  bool JUMPING = false;
  bool WALKING = false;
  bool LOOK_RIGHT = false;
  bool LOOK_LEFT = false;
  
  double velocity_y = 0.0;
  double accel = 1.5;
  static double GROUND_LEVEL = 300.0;
  SpriteSheet sprite;
  
  Player(){
    
    x = 0.0;
    y = 300.0;
    width = 60.0;
    height = 100.0;
    img = new Element.tag("img");
    img.src = "./content/buzz.png";
    input = new Input();
    sprite = new SpriteSheet("./content/buzzspritesheet.png",0,0,75,100);
    //WALKING = true;
    print("begin");
    
  }
  
   draw(){
     double cx = this.x - camera.x;
     double cy = this.y - camera.y;
    //context.drawImageScaled(img, cx - width/2, cy - height/2, width, height);
     
     
     if(JUMPING && LOOK_RIGHT){

        sprite.spritex = 225;
        sprite.spritey = 200;

       sprite.drawOnPosition(cx-width/2, cy - height/2 , width , height);
       
     }
     
     else if(JUMPING && LOOK_LEFT){
      
         sprite.spritex = 225;
         sprite.spritey = 300;

       sprite.drawOnPosition(cx-width/2, cy - height/2 , width , height);
     }

     else if(WALKING && LOOK_RIGHT){
       if(sprite.spritex >= 825){
         sprite.spritex = 0;
         sprite.spritey = 0;
       }
       else{
       sprite.spritex = sprite.spritex + 75;
       sprite.spritey = 0;
       }
       
       print(sprite.spritex  + sprite.spritey);
       sprite.drawOnPosition(cx-width/2, cy - height/2 , width , height);
     }
     
     else if(WALKING && LOOK_LEFT){
       if(sprite.spritex <= 0){
         sprite.spritex = 825;
         sprite.spritey = 100;
       }
       else{
       sprite.spritex = sprite.spritex - 75;
       sprite.spritey = 100;
       }
       sprite.drawOnPosition(cx-width/2, cy - height/2 , width , height);
     }
     
     else {
       if(LOOK_LEFT){
         sprite.spritex = 825;
         sprite.spritey = 100;
       }
       else{
         sprite.spritex = 0;
         sprite.spritey = 0;
       }
       
       sprite.drawOnPosition(cx-width/2, cy - height/2 , width , height);
     }
  }
   
   update(double dt){
     
     if (input.isDown(KeyCode.UP)){
       
       //if currently jumping
       if(JUMPING){
         //do nothing 
       }
       
       //start jump motion
       else{
       SoundManager.instance.playSound(SoundManager.enumSoundJump);
       JUMPING = true;
       velocity_y = 25.0;}

     }
   
     
     //down key does nothing for now
     if (input.isDown(KeyCode.DOWN)){
       //y += 1;    
     }
     
     //move right
     if (input.isDown(KeyCode.RIGHT)){
       x += 3 * dt;
       WALKING = true;
       LOOK_RIGHT = true;
       LOOK_LEFT = false;
       
     }
     
     else{
       WALKING = false;
       //LOOK_RIGHT = false;
     }
     
     //move left
     if (input.isDown(KeyCode.LEFT)){
       x -= 3 * dt;
       WALKING = true;
       LOOK_LEFT = true;
       LOOK_RIGHT = false;
     }
     else{
       if(!WALKING){
       WALKING = false;}
       //LOOK_LEFT = false;
     }
     
       
     //if in jumping motion
     if(JUMPING){
       
         if(velocity_y > - 130.0){
            velocity_y = velocity_y - accel;
            y = y - velocity_y * dt;// - 50);
        //    x += 1;  ?
         }
       }
       
       
       
      if(y >= GROUND_LEVEL){
         velocity_y = 0.0;
         JUMPING = false;
         y = 300.0;
       }
     
   }
  
  
}