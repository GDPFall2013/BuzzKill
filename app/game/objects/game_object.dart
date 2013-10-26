part of gdp;


/*
 * The game object is the parent object of every object that can be displayed on the
 * screen.  It has many subclasses, including enemies, blocks, and the player.
 */
class GameObject {
  double x;
  double y;
  double height = 0.0;
  double width = 0.0;
  
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
  
  /**
   * In order for free listing to work, this kind of setup must 
   * be done somewhere other than the constructor
   * The initialize method offers a way to do so.
   * TODO: Will we be using free listing?
   */
  initialize(double x, double y) {
    this.x = x;
    this.y = y;
  }
}

/*
 *  This is for debugging and testing purposes only.  Shows a box around all the objects.
 */
drawColliderBox(GameObject go){
  assert(go.height > 0.0);
  assert(go.width > 0.0);
  
  double x = go.x;
  double y = go.y;
  
  context.save();
  context.beginPath(); 
  context.moveTo(x - go.width/2, y - go.height/2);
  context.lineTo(x + go.width/2, y - go.height/2);
  context.lineTo(x + go.width/2, y + go.height/2);
  context.lineTo(x - go.width/2, y + go.height/2);
  context.lineTo(x - go.width/2, y - go.height/2);
  context.strokeStyle = "black";  //Should this be capitalized?
  context.stroke();
  context.restore();
}