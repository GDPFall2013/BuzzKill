part of gdp;

/**
 * A block represents a game object that does not move and the player cannot move through.
 * Ground is the most common use case.
*/
class Trigger extends GameObject {
  
  SpriteSheet trigger = new SpriteSheet("./content/gameitems.png",263,0,120,20);
  Block bossFloor;
  Enemy boss;
  Block floorObstacle;
  
  var img = new ImageElement();
  
  double originalY;
  
  initialize(double x, double y) {
    super.initialize(x, y);
    originalY = y;  //to reset trigger position when Buzz steps off 
  }
  
  //objects affected by trigger
  setTriggerObjects(Block bf, Enemy b, Block fo){
    bossFloor = bf;
    boss = b;
    floorObstacle = fo;
  }
  
  //set obstacle to collapse once trigger is hit
  setTriggerObstacle(Block fo){
    floorObstacle = fo;
  }

  draw() {
      trigger.drawOnPosition(x-this.width/2, y-this.height/2, 120.0 , 20.0);   
  }
  
  //collapse objects when Buzz stands on trigger
  collapse(){
    if(bossFloor!= null){
    bossFloor..triggerFall = true;
    }
    
    if(boss != null){
    boss..triggerFall = true;
    }
    
    if(floorObstacle != null){
    floorObstacle..triggerFall = true;
    }
  }
}