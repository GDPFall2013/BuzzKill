part of gdp;

/**
 *  The Game class holds the root of the game.  It is started by Main
 *  and controls all other parts of the application. 
 */
class Game{
  
Player player = new Player();
Alien obstacle = new Alien();


Game() {
    ObjectManager om = new ObjectManager();
    SoundManager sm = new SoundManager();
    om.addObject(player);
    om.addObject(obstacle);
    
    Block floor = new Block();
    floor.initialize(0.0, viewportHeight - 70.0);
    floor.width = viewportWidth - 0.0;  //TODO: convert this to double properly
    floor.height = 30.0;
    ObjectManager.instance.addObject(floor);
    ObjectManager.instance.blockList.add(floor);
}

/**
 *  Update is called once per game Loop
 */
void update(double dt) {
  
  // Adjust the camera position
  if (player.x - camera.x > viewportWidth - 150) {
    camera.x = player.x - (viewportWidth - 150);
  }
  if (player.x - camera.x < 150) {
    camera.x = player.x - 150;
  }
  
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
  context.fillRect(0, 0, 640, 480);
  
  for (GameObject go in ObjectManager.instance.goList) {
    
    // TODO: Change so its not just objects that have their middle in the screen that get drawn
    if (go.x + go.width/2 > camera.x && 
        go.x - go.width/2 < camera.x + viewportWidth) {
      go.draw();
      DrawColliderBox(go);
    }
  }
}

}