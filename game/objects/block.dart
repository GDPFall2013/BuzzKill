part of gdp;

/**
 * A block represents a game object that does not move and the player cannot move through.
 * Ground is the most common use case.
*/
class Block extends GameObject {
  
  SpriteSheet boulder = new SpriteSheet("./content/gameitems.png",50,0,120,100);
  //SpriteSheet platform = new SpriteSheet("./content/gameitems.png",170,0,130,140);
  
  var img = new ImageElement();
  bool isObstacle = false;
  bool triggerFall = false;
  bool moving = false;
  bool spring = false;
  bool goingBack = false;
  double speedX = 0.0;
  double speedY = 0.0;
  bool vertical = false;
  bool diagonal = false;
  bool upToDown = false;
  bool still = true;
  bool backUp = false;
  
  initialize(double x, double y) {
    super.initialize(x, y);
    img.src = "./content/platform.png"; 
   
  }
  

  draw() {
   
    //draw boulder
    if(height <= 100.0 && !isObstacle){
      boulder.drawOnPosition(x-this.width/2, y-this.height/2, 120.0 , 100.0);   
    }
    
    //trigger block obstacle collapse
    else{
      if(triggerFall && isObstacle && y<(850)){
        y = y + 5;
        print(y);
        //height = height - 10.5;
        normContext.save();
        ctx.beginPath();
        CanvasPattern pattern = normContext.createPatternFromImage(img, 'repeat');
        ctx.rect(x-this.width/2,y-this.height/2, width, height);
        normContext.fillStyle = pattern;
        normContext.closePath();
        ctx.fill();
        normContext.restore();
        still = false;
        backUp = false;
      }
      
      else if(!triggerFall && isObstacle && y>=100){
        
        y = y - 5;
                //height = height - 10.5;
                normContext.save();
                ctx.beginPath();
                CanvasPattern pattern = normContext.createPatternFromImage(img, 'repeat');
                ctx.rect(x-this.width/2,y-this.height/2, width, height);
                normContext.fillStyle = pattern;
                normContext.closePath();
                ctx.fill();
                normContext.restore();
                still = false;
                backUp = true;
      }
      
      //trigger enemy floor collapse
      else if(triggerFall && !isObstacle){
        y += 3;
        normContext.save();
        ctx.beginPath();
        CanvasPattern pattern = normContext.createPatternFromImage(img, 'repeat');
        ctx.rect(x-this.width/2,y-this.height/2, width, height);
        normContext.fillStyle = pattern;
        normContext.closePath();
        ctx.fill();
        normContext.restore();
        still = false;
        backUp = false;
      }
      
      //regular inanimate floor
      else{
      normContext.save();
      ctx.beginPath();
      CanvasPattern pattern = normContext.createPatternFromImage(img, 'repeat');
      ctx.rect(x-this.width/2,y-this.height/2, width, height);
      normContext.fillStyle = pattern;
      normContext.closePath();
      ctx.fill();
      normContext.restore();
      still = true;
      backUp = false;
      triggerFall = false;
      }
    }
  }
}