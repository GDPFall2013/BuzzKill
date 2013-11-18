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
  
   double injure() {
    return 10.0;
   }
   
 
}