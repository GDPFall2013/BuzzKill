part of gdp;

/**
 * A block represents a game object that does not move and the player cannot move through.
 * Ground is the most common use case.
*/
class VerticalBlock extends Block {
  
  //SpriteSheet boulder = new SpriteSheet("./content/gameitems.png",50,0,120,100);
  //SpriteSheet platform = new SpriteSheet("./content/gameitems.png",170,0,130,140);
  
  //var img = new ImageElement();
  //bool isObstacle = false;
  //bool triggerFall = false;
  
  double initialX = 0.0;
  double initialY = 0.0;
  double endX = 0.0;
  double endY = 0.0;
  double speedY = 1.0;
  SpriteSheet boulder = new SpriteSheet("./content/gameitems.png",50,0,120,100);
  bool goingBack = false;
  bool vertical = true;
  bool once = false;
  var img = new ImageElement();
  //img.src = "./content/platform.png";
  CanvasPattern pattern;
  
  initializeMove(double startX, double startY, double endX, double endY) {
    super.initialize(startX, startY);
    img.src = "http://www.html5canvastutorials.com/demos/assets/wood-pattern.png"; 
    initialX = startX;
    initialY = startY;
    this.endX = endX;
    this.endY = endY;
    moving = true;
    pattern =normContext.createPatternFromImage(img, 'repeat');
  }
  

  draw() {
   //print('draw');

    boulder.drawOnPosition(x-this.width/2, y-this.height/2, 120.0 , 100.0);  

  }
  
  update(double dt){
    //print('update');
    //double speed = 1.5 * dt;
    
    if (goingBack == false) {
      if(y < endY){
        y = y + speedY;
      }
      else{
        goingBack = true;
        //sprite.spritey = 50;
      }
    } 
    else {
      if(y>initialY){
        y = y - speedY;
      }
      else{
        goingBack = false;
        //sprite.spritey = 0;
      }
    }

  }
}