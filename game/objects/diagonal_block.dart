part of gdp;

/**
 * A block represents a game object that does not move and the player cannot move through.
 * Ground is the most common use case.
*/
class DiagonalBlock extends Block {
  
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
  double speedX = 2.0;
  SpriteSheet boulder = new SpriteSheet("./content/gameitems.png",50,0,120,100);
  bool goingBack = false;
  bool diagonal = true;
  bool upToDown = false;
  
  initializeMove(double startX, double startY, double endX, double endY) {
    super.initialize(startX, startY);
    //img.src = "./content/platform.png"; 
    initialX = startX;
    initialY = startY;
    this.endX = endX;
    this.endY = endY;
    moving = true;

  }
  

  draw() {
   //print('draw');
    

     /* normContext.save();
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
    if(upToDown){
      if (goingBack == false) {
            if(y < endY){
              y = y + speedY;
              x = x + speedX;
            }
            else{
              goingBack = true;
              //sprite.spritey = 50;
            }
          } 
          else {
            if(y>initialY){
              y = y - speedY;
              x = x - speedX;
            }
            else{
              goingBack = false;
              //sprite.spritey = 0;
            }
          }
    }
    
    
    
    else{
    if (goingBack == false) {
      if(y < endY){
        y = y + speedY;
        x = x - speedX;
      }
      else{
        goingBack = true;
        //sprite.spritey = 50;
      }
    } 
    else {
      if(y>initialY){
        y = y - speedY;
        x = x + speedX;
      }
      else{
        goingBack = false;
        //sprite.spritey = 0;
      }
    }
    }
    
  }
}