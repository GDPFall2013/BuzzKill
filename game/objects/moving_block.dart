part of gdp;

/**
 * A block represents a game object that does not move and the player cannot move through.
 * Ground is the most common use case.
*/
class MovingBlock extends Block {
  
  //SpriteSheet boulder = new SpriteSheet("./content/gameitems.png",50,0,120,100);
  //SpriteSheet platform = new SpriteSheet("./content/gameitems.png",170,0,130,140);
  
  //var img = new ImageElement();
  //bool isObstacle = false;
  //bool triggerFall = false;
  
  double initialX = 0.0;
  double endX = 0.0;
  double endY = 0.0;
  bool goingBack = false;
  double speedX = 1.0;
  

  
  initializeMove(double startX, double startY, double endX, double endY) {
    super.initialize(startX, startY);
    //img.src = "./content/platform.png"; 
    initialX = startX;
    this.endX = endX;
    this.endY = endY;
    moving = true;
    num w = this.width;
    num h = this.height;
    SpriteSheet boulder = new SpriteSheet("./content/gameitems.png",50,0,w,h);
  }
  

  draw() {
   //print('draw');
    /*
      normContext.save();
      ctx.beginPath();
      CanvasPattern pattern = normContext.createPatternFromImage(img, 'repeat');
      ctx.rect(x-this.width/2,y-this.height/2, width, height);
      normContext.fillStyle = pattern;
      normContext.closePath();
      ctx.fill();
      normContext.restore();
     */
    boulder.scaledh = this.height;
    boulder.scaledw = this.width;
    boulder.drawOnPosition(x-this.width/2, y-this.height/2, width , height); 
    
  }
  
  update(double dt){
    //print('update');
    //double speed = 1.5 * dt;
    
    if (goingBack == false) {
      if(x < endX){
        x = x + speedX;
      }
      else{
        goingBack = true;
        //sprite.spritey = 50;
      }
    } else {
      if(x>initialX){
        x = x - speedX;
      }
      else{
        goingBack = false;
        //sprite.spritey = 0;
      }
    }

  }
}