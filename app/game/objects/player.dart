part of gdp;



class Player extends GameObject{
  
  ImageElement img = new ImageElement();

  Input input;
  bool JUMPING = false;
  double velocity_y = 0.0;
  double accel = 1.5;
  static double GROUND_LEVEL = 300.0;
  
  
  Player(){
    
    x = 0.0;
    y = 300.0;
    width = 60.0;
    height = 100.0;
    img = new Element.tag("img");
    img.src = "./content/buzz.png";
    input = new Input();

    
  }
  
   draw(){
    context.drawImageScaled(img, x, y, width, height);
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
     }
     
     //move left
     if (input.isDown(KeyCode.LEFT)){
       x -= 3 * dt;
       
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