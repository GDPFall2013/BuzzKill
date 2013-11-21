part of gdp;

/**
 *  The Game class holds the root of the game.  It is started by Main
 *  and controls all other parts of the application. 
 */
class Game{
  static Game instance;
  factory Game() {
    
    if (instance == null) {
      instance = new Game._internal();
      instance.Initialize();
    }
    return instance;
  }
  Game._internal();
  
  
  Player player = new Player();
static double oxygen = 100.0; 
Stopwatch oxygenTimer = new Stopwatch();
double lastOxygenTick = 0.0;

static int lives = 3;
Alien alien2 = new Alien(400.0);


int stateEnumPlay = 1;
int stateEnumWin = 2;
int stateEnumGameOver = 3;

int state;

Initialize() {
  LevelManager lm = new LevelManager();
  lm.loadLevel(1, player);
    state = stateEnumPlay;

    oxygenTimer.start();
}

/**
 *  Update is called once per game Loop
 */
void update(double dt) {
  if (state == stateEnumPlay) {
    
    // Adjust the camera position
    if (player.x - camera.x > viewportWidth - 205) {
      camera.x = player.x - (viewportWidth - 205);
    }
    if (player.x - camera.x < 205) {
      camera.x = player.x - 205;
    }
    
    for (GameObject go in ObjectManager.instance.goList) {
      go.update(dt);
    }
    
    //Drain Oxygen
    if (oxygenTimer.elapsedMilliseconds > 250 + lastOxygenTick){
      lastOxygenTick += 250;
      oxygen -= 1;
    }
    
    ObjectManager.instance.removeDeadObjects();
  }
}

/**
 *  Draw is called once per Render? I believe.  Its called
 *  By the Game Loop
 */
void draw() {
  if (state == stateEnumPlay) {
  
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
  
  drawHUD();
  
  } else if (state == stateEnumWin) {
    context.fillStyle = 'black';
    context.fillRect(0, 0, 640, 480);
    
    context.fillStyle = 'white';
    context.font = "normal 30pt calibri";
    context.fillText("YOU WIN!", viewportWidth/2 - 70, viewportHeight/2 - 40, 1000);
  } else if (state == stateEnumGameOver){
    context.fillStyle = 'black';
    context.fillRect(0, 0, 640, 480);
    
    context.fillStyle = 'white';
    context.font = "normal 30pt calibri";
    context.fillText("Suffocation!", viewportWidth/2 - 70, viewportHeight/2 - 40, 1000);
    
  }
  
  
}

/**
 * Draws textual information around the edges of the screen that does not move with
 * the camera.
 */
drawHUD() {  //TODO: Change this information into Game Variables
  context.save();
  context.fillStyle = 'black';
  context.font = "normal 14pt calibri";
  context.fillText("BUZZKILL", 10, 20, 100);
  //context.fillText("Score:  ?????", viewportWidth/2 -35, 20, 100);  Do we have score in this game?
  context.fillText("Lives: $lives", 10, viewportHeight-15, 100);
  context.fillText("Remaining Oxygen: $oxygen", viewportWidth - 200, viewportHeight-15, 500);
  context.restore();
}

/**
 * Code to trigger when the game has been won
 */
win() {
  // music to be placed here in the future
  
  state = stateEnumWin;
}

gameOver() {
  // music to be placed here in the future
  state = stateEnumGameOver;
}

}