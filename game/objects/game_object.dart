part of gdp;


/*
 * The game object is the parent object of every object that can be displayed on the
 * screen.  It has many subclasses, including enemies, blocks, and the player.
 */
abstract class GameObject {
  double x;
  double y;
  double height = 0.0;
  double width = 0.0;
  bool dead = false;
  
  GameObject() {}
  
  /**
   *  This method should be overriden
   *  Object determines how it should be drawn
   */
  draw() {
    
  }
  
  /**
   *  This method should be overriden
   *  What does the object do per frame
   */
  update(double dt) {
    
  }
  
  initialize(double x, double y) {
    this.x = x;
    this.y = y;
  }
}

/*
 *  This is for debugging and testing purposes only.  Shows a box around all the objects.
 */
DrawColliderBox(GameObject go){
  assert(go.height > 0.0);
  assert(go.width > 0.0);
  
  ctx.save();
  ctx.beginPath(); 
  ctx.rect(go.x - go.width/2, go.y - go.height/2, go.width, go.height);
  normContext.strokeStyle = "white";
  ctx.stroke();
  ctx.restore();
}