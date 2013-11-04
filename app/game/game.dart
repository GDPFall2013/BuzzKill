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
    floor.initialize(viewportWidth/2, viewportHeight - 70.0);
    floor.width = viewportWidth - 0.0;  //TODO: convert this to double properly
    floor.height = 30.0;
    ObjectManager.instance.addObject(floor);
    ObjectManager.instance.blockList.add(floor);
}

/**
 *  Update is called once per game Loop
 */
void update(double dt) {
  
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
    go.draw();
  }
}

}