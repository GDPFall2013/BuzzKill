part of gdp;

/**
 * A block represents a game object that does not move and the player cannot move through.
 * Ground is the most common use case.
*/
class Block extends GameObject {
  
  SpriteSheet boulder = new SpriteSheet("./content/gameitems.png",50,0,120,100);
  //SpriteSheet platform = new SpriteSheet("./content/gameitems.png",170,0,130,140);
  
  var img = new ImageElement();
  
  initialize(double x, double y) {
    super.initialize(x, y);
    img.src = "./content/platform.png"; 
  }
  
  // Since this is a block, it should be filled in
  draw() {
   
    if(height <= 100.0){
      boulder.drawOnPosition(x-this.width/2, y-this.height/2, 120.0 , 100.0);   
    }
    
    else{

      normContext.save();
      context.beginPath();
      CanvasPattern pattern = normContext.createPatternFromImage(img, 'repeat');
      context.rect(x-this.width/2,y-this.height/2, width, height);
      normContext.fillStyle = pattern;
      normContext.closePath();
      context.fill();
      normContext.restore();
    }
  }
}