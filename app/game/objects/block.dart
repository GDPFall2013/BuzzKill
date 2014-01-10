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
      double cx = x - camera.x;
      double cy = y - camera.y;
     /* assert(this.height > 0.0);
      assert(this.width > 0.0);
      
      double cx = x - camera.x;
      double cy = y - camera.y;
      context.save();
      context.beginPath(); 
      context.fillStyle = "Grey";
      context.moveTo(cx - this.width/2, cy - this.height/2);
      context.lineTo(cx + this.width/2, cy - this.height/2);
      context.lineTo(cx + this.width/2, cy + this.height/2);
      context.lineTo(cx - this.width/2, cy + this.height/2);
      context.lineTo(cx - this.width/2, cy - this.height/2);
      context.fill();
      context.stroke();
      context.restore();
      */
      boulder.drawOnPosition(cx-this.width/2, cy-this.height/2, 120.0 , 100.0);   
    }
    
    else{
      
      double cx = x - camera.x;
      double cy = y - camera.y;
      
      CanvasPattern pattern = context.createPatternFromImage(img, 'repeat');
      context.rect(cx-this.width/2,cy-this.height/2, width, height);
      context.fillStyle = pattern;
      context.fill();
    }
  }
}