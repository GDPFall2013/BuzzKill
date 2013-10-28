part of gdp;

/**
 *  The Game class holds the root of the game.  It is started by Main
 *  and controls all other parts of the application. 
 */
class Game{
//Input input;
Player player = new Player();


Game() {
    //input = new Input();
    ObjectManager om = new ObjectManager();
    om.addObject(player);
}

//TODO remove when player is added
int x = 20;
int y = 30;

/**
 *  Update is called once per game Loop
 */
void update(double dt) {
  
  // Some test code for Movement.  TODO remove when player is added
 
/*  
  if (input.isDown(KeyCode.UP)){
   y -= 1;
  }
  if (input.isDown(KeyCode.DOWN)){
   y += 1;
  }
  if (input.isDown(KeyCode.RIGHT)){
   x += 1;
  }
  if (input.isDown(KeyCode.LEFT)){
   x -= 1;
  }
  */
  
  for (GameObject go in ObjectManager.instance.goList) {
    go.update(dt);
  }
}

/**
 *  Draw is called once per Render? I believe.  Its called
 *  By the Game Loop
 */
void draw() {
  // Does a gray background so we can see the canvas size
  context.fillStyle = 'gray';
  context.fillRect(09, 0, 640, 480);
  
  for (GameObject go in ObjectManager.instance.goList) {
    go.draw();
  }
  
  
  //TODO remove this part once we have a player to move
  /*
  context.fillStyle = 'black';
  context.font = "normal 20pt san-serif";
  context.fillText(" Boiler Plate ", x, y, 100);
  */
  
}

}