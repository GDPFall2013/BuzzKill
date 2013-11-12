part of gdp;



class Alien extends Enemy{
  
  ImageElement img = new ImageElement();

  Input input;
  bool JUMPING = false;
  double velocity_y = 0.0;
  double accel = 10.0;
  static double GROUND_LEVEL = 300.0;
  
  
  Alien(){
    
    x = 300.0;
    y = 300.0;
    width = 60.0;
    height = 158.0;
    img = new Element.tag("img");
    img.src = "./content/AlienTurtle.png";
    input = new Input();

    
  }
  
   draw(){
     double cx = this.x - camera.x;
     double cy = this.y - camera.y;
     
    context.drawImageScaled(img, cx - width/2, cy - height/2, width, height);

  }
  
   injure() {
     Game.oxygen -= 10.0; // TODO: Call Method in Player that he's been hurt by X amount
   }
   
   /*
   update(double dt){
     
     if (input.isDown(KeyCode.UP)){
       
       //if currently jumping
       if(JUMPING){
         //do nothing 
       }
       
       //start jump motion
       else{
       JUMPING = true;
       velocity_y = 130.0;}

     }
   
     
     //down key does nothing for now
     if (input.isDown(KeyCode.DOWN)){
       //y += 1;    
     }
     
     //move right
     if (input.isDown(KeyCode.RIGHT)){
       x += 2;
     }
     
     //move left
     if (input.isDown(KeyCode.LEFT)){
       x -= 2;
       
     }
     
       
     //if in jumping motion
     if(JUMPING){
       
         if(velocity_y > -130.0){
            velocity_y = velocity_y - accel;
            y = y - (velocity_y - 50);
            x += 1;
         }
       }
       
       
       
      if(y >= GROUND_LEVEL){
         velocity_y = 0.0;
         JUMPING = false;
         y = 300.0;
       }
     
   }*/
  
  
}