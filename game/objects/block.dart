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
      if(triggerFall && isObstacle && y<430){
        y = y + 5;
        height = height - 10.5;
        normContext.save();
        ctx.beginPath();
        CanvasPattern pattern = normContext.createPatternFromImage(img, 'repeat');
        ctx.rect(x-this.width/2,y-this.height/2, width, height);
        normContext.fillStyle = pattern;
        normContext.closePath();
        ctx.fill();
        normContext.restore();
        
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
      }
    }
  }
}