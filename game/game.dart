library gdp;

import 'dart:html';
import 'dart:collection';
import "dart:convert";
import "dart:js";
import 'dart:math';

//import 'packages/js/js.dart' as js;
import 'package:game_loop/game_loop_html.dart';
import 'package:chrome/chrome_app.dart' as chrome;

import 'canvas/canvas.dart';
import 'dart:core';
import 'dart:web_audio';

part 'input_manager.dart';
part 'object_manager.dart';
part 'audio/sound_manager.dart';
part 'globals.dart';

part 'objects/projectiles/projectile.dart';
part 'objects/projectiles/bullet.dart';
part 'objects/projectiles/cyrax_net.dart';
part 'objects/projectiles/cyrax_shuriken.dart';
part 'objects/projectiles/cyrax_mini_shuriken.dart';

part 'objects/cyrax/cyrax.dart';
part 'objects/cyrax/cyrax_attack.dart';
part 'objects/cyrax/net_attack.dart';
part 'objects/cyrax/shuriken_attack.dart';
part 'objects/cyrax/mini_shuriken_attack.dart';

part 'objects/game_object.dart';
part 'objects/block.dart';
part 'objects/player.dart';
part 'objects/alien.dart';
part 'objects/oxygen.dart';
part 'objects/ship_item.dart';
part 'objects/spike.dart';
part 'objects/item.dart';
part 'objects/enemy.dart';
part 'objects/gorilla.dart';
part 'objects/droid.dart';
part 'objects/ingame_menu.dart';
part 'objects/trigger.dart';
part 'objects/moving_block.dart';
part 'objects/clone.dart';
part 'objects/spring.dart';
part 'objects/vertical_block.dart';
part 'objects/diagonal_block.dart';
part 'objects/end_scene.dart';

part 'animations/sprite_sheet.dart';

part 'levels/level_manager.dart';
part 'levels/level_one.dart';
part 'levels/level_test.dart';
part 'levels/level_two.dart';
part 'levels/level_three.dart';
part 'levels/level_four.dart';
part 'levels/level_menu.dart';
part 'levels/main_menu.dart';
part 'levels/controls.dart';
part 'levels/level_transition.dart';
part 'levels/options_screen.dart';


part 'collision/collision_system.dart';

//The Game Loop
GameLoopHtml gameLoop = new GameLoopHtml(canvas);


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
MainMenu menu = new MainMenu();
InGameMenu gameMenu = new InGameMenu();
Controls controls = new Controls();
Options options = new Options();
LevelTransition transition;
EndScene endScene;

static double oxygen = 100.0; 
Stopwatch oxygenTimer = new Stopwatch();
double lastOxygenTick = 0.0;

Stopwatch restartTimer = new Stopwatch();
int counter=-1;

static int lives = 3;
Input input = new Input();

int currentLevel;
int startLevel;
double lastENTER=0.0;
double lastESC = 0.0;

int stateEnumPlay = 1;
int stateEnumWin = 2;
int stateEnumGameOver = 3;
int stateEnumPause = 4;
int stateEnumMain = 5;
int stateEnumControls = 6;
int stateEnumTransition = 7;
int stateEnumIntro = 8;
int stateEnumOptions = 9;
int stateEnumCollected = 10;
int stateEnumOutro = 11;

bool resetMainMenu = false; //used to reset main menu if prev screen was pause menu
int state;
int oxygenCollected;

// variables for Performance testing
double updatesPerSecond = 0.0;
double rendersPerSecond = 0.0;
double debuggingDisplayTime = 0.0;
double numberOfUpdates = 0.0;
double numberOfRenders = 0.0;

LevelManager levelManager;

// lastFrame is a fix on one keyboard button being referenced twice for a single push
 int _lastFrame;
 
Initialize() {
  buildCanvas();
  SoundManager sm = new SoundManager();
  CollisionSystem cs = new CollisionSystem();
  ObjectManager objectManager = new ObjectManager();
  levelManager = new LevelManager();
  transition = new LevelTransition();
  endScene = new EndScene();
  Globals.setNormalDifficulty();

  

  //gameLoop.onUpdate = ((gameLoop) {update(gameLoop.dt * 100);});

  gameLoop.onUpdate = ((gameLoop) {
    // This if Statement is a temporary fix for an issue with Game Loop
    // It was sometimes causing 1 keypress to be registered multiple times
    if (_lastFrame == gameLoop.frame) {
      return;
    } else {
      _lastFrame = gameLoop.frame;
    }
    update(gameLoop.dt * 100 * Globals.gameSpeed);});

  gameLoop.onRender = ((gameLoop) {draw();});
  gameLoop.start();
  
 // currentLevel = LevelManager.enumLevelTest;
 // levelManager.loadLevel(LevelManager.enumLevelTest);
  currentLevel = LevelManager.enumMainMenu;
  startLevel = LevelManager.enumMainMenu;
  levelManager.loadLevel(LevelManager.enumMainMenu);
  state = stateEnumMain;
  oxygenCollected = 0;
  Globals.setBackground();
  
  if(currentLevel >= LevelManager.enumLevelOne){
    oxygenTimer.start();
  }
    
  //SoundManager.instance.toggleMute();
  
}

/**
 *  Update is called once per game Loop
 */
void update(double dt) {
  //print(state);
  Input.instance.controllerButtonPushed = false;
  Input.instance.controllerAxesRight = false;
  Input.instance.controllerAxesLeft = false;
  Input.instance.controllerAxesDown = false;
  Input.instance.controllerAxesUp = false;
  Input.instance.update();
  //if(ObjectManager.instance.goList.isEmpty){

  //print(input.timeReleased(KeyCode.ENTER));
  //Main Menu
    if(currentLevel == LevelManager.enumMainMenu || state == stateEnumMain){
      
     if(resetMainMenu){
      menu = new MainMenu();
      gameMenu = new InGameMenu();
      }
      
      resetMainMenu = false;
      menu.update(dt);
      menu.draw();
      
     
         
  }
  
    
  //Play Game
  if (state == stateEnumPlay) {
    // Adjust the camera position
    if (player.x - camera.x > viewportWidth - 205) {
      camera.x = player.x - (viewportWidth - 205);
    }
    if (player.x - camera.x < 205) {
      camera.x = player.x - 205;
    }
    
    for (GameObject go in ObjectManager.instance.goList) {
      double goRightEdge = go.x + go.width/2;
      double goLeftEdge = go.x - go.width/2;
      if (goRightEdge > (camera.x - (viewportWidth / Camera.instance.screenRatio))  && 
          goLeftEdge < (camera.x + (viewportWidth / Camera.instance.screenRatio))) {
        go.update(dt);
      }
    }
    
    //Drain Oxygen
    if(player.ATTACKED){
      pauseOxygenDrain();
    }
    else if (oxygenTimer.elapsedMilliseconds > Globals.oxygenLossRate + lastOxygenTick && currentLevel>=LevelManager.enumLevelOne &&
        oxygen >0){
      lastOxygenTick += Globals.oxygenLossRate;
      oxygen -= 1;

    }
    
    ObjectManager.instance.removeDeadObjects();
    
    //Bring up in-game menu
    if(Input.instance.isDown(KeyCode.ESC)){
      
      if(input.timePressed(KeyCode.ESC) - Game.instance.lastESC > 0.0){
        lastESC = input.timePressed(KeyCode.ESC);
        resetMainMenu = true;
        state = stateEnumPause;
        gameMenu.draw();
        gameMenu.update(dt);
     }  
    }
    
  }

  
  //in-game menu
  if(state == stateEnumPause){
    //gameMenu.draw();
    gameMenu.update(dt);
    
    //pause oxygen drain
    pauseOxygenDrain();
    
    if(resetMainMenu){
      gameMenu = new InGameMenu();
      resetMainMenu = false;
    }
    
  }
  
  
  //controls screen
  if(state == stateEnumControls){
    controls.update(dt);
    //pause oxygen drain
    pauseOxygenDrain();
  }

  
  //options screen
  if(state == stateEnumOptions){
    options.update(dt);
    //pause oxygen drain
    pauseOxygenDrain();
  }  
  
  
  //Level transition screen
  if(state == stateEnumTransition || state == stateEnumIntro){
    normContext.clearRect(0, 0,640, 480);
    transition.update(dt);
    transition.draw();
  }
  
  //Space Item collected
  if(state == stateEnumCollected){
    //normContext.clearRect(0, 0,640, 480);
    //transition.update(dt);
    //transition.draw();
    pauseOxygenDrain();
    for (GameObject go in ObjectManager.instance.goList) {
          go.update(dt);
        }
    
    

    
// Adjust the camera position
 if (player.x - camera.x > viewportWidth - 205) {
   camera.x = player.x - (viewportWidth - 205);
 }
 if (player.x - camera.x < 205) {
   camera.x = player.x - 205;
 }
 
  }
  
  
  if(state == stateEnumOutro){
    //Globals.setBackground();
    endScene.update(dt);
    endScene.draw();
  }
  
  // Frames per second debugging Information
  numberOfUpdates += 1.0;
  debuggingDisplayTime += dt;
  if (debuggingDisplayTime > 100.0) {
    debuggingDisplayTime -= 100.0;
    updatesPerSecond = numberOfUpdates;
    rendersPerSecond = numberOfRenders;
    numberOfUpdates = 0.0;
    numberOfRenders = 0.0;
  }
  

}

/**
 *  Draw is called once per Render? I believe.  Its called
 *  By the Game Loop
 */
void draw() {
 
  if(currentLevel == LevelManager.enumMainMenu || state == stateEnumMain){
    normContext.clearRect(0, 0,640, 480);
    menu.draw();
  }
  
  if(state==stateEnumTransition || state == stateEnumIntro){
    normContext.clearRect(0, 0,640, 480);
    transition.draw();
  }
  
  //controls screen
  if(state == stateEnumControls){
  controls.draw();
  }

  //options screen
  if(state == stateEnumOptions){
  options.draw();
  }
  
  //pause menu
  if(state == stateEnumPause){
        
        normContext.clearRect(0, 0,640, 480);
        
        drawObjects();
        
        gameMenu.draw();
      }
  
  
  //playing
  else if (state == stateEnumPlay) {
    normContext.clearRect(0, 0,640, 480);
    
    //if(ObjectManager.instance.goList.isEmpty){
    if(currentLevel == LevelManager.enumMainMenu){
    menu.draw();}
    
    if(state == stateEnumPause){
      gameMenu.draw();
    }
    
  drawObjects();
  drawHUD();
  
  }
  
  else if(state == stateEnumCollected){
    normContext.clearRect(0, 0,640, 480);
    drawObjects();
      
      drawHUD();
  }
  
  else if (state == stateEnumWin) {

    
    //For beta-testing only. Need to change so "You Win" message shows after level 4
    if(currentLevel < LevelManager.enumLevelFour){
      //currentLevel += 1;
      //reloadLevel();
      state = stateEnumTransition;
      transition.update(0.0);
      transition.draw();
    }
    
    else{
         
      state = stateEnumOutro;
      endScene = new EndScene();
      normContext.clearRect(0, 0,640, 480);
      Globals.setBackground();
     // ObjectManager.instance.addObject(endScene);
      
     /* 
          normContext.fillStyle = 'black';
          normContext.fillRect(0, 0, 640, 480);
          
          normContext.fillStyle = 'white';
          normContext.font = "normal 30pt calibri";
          normContext.fillText("YOU WIN!", viewportWidth/2 - 70, viewportHeight/2 - 40, 1000);
          
          
    //TODO Put this code somewhere else!  This was a last minute bugfix for Beta
          normContext.save();
          normContext.font = "normal 15pt calibri";
          normContext.fillText('Press Enter to continue.', 420, 420, 1000);
          normContext.restore();
          
          if (input.isDown(KeyCode.ENTER)) {
            Game.instance.currentLevel = LevelManager.enumMainMenu;
            Game.instance.state = Game.instance.stateEnumMain;
            Game.instance.lastENTER = input.timePressed(KeyCode.ENTER);
            Game.instance.resetMainMenu = true;
            Game.instance.menu.playGame = true;
            
          }
          */
    }

  }
  
  else if(state == stateEnumOutro){
    normContext.clearRect(0, 0,640, 480);
    endScene.draw();
  }
  
  
  else if (state == stateEnumGameOver){
    normContext.fillStyle = 'black';
    normContext.fillRect(0, 0, 640, 480);
    
    normContext.fillStyle = 'white';
    normContext.font = "normal 30pt calibri";
    normContext.fillText("Buzz didn't make it...", viewportWidth/2 - 120, viewportHeight/2 - 40, 1000);
    normContext.save();
    
    //calculate time left to choose to continue
    double secs2=0.00000000001;
    num secs = restartTimer.elapsedMilliseconds/1000;
     secs2 = ((secs*5) /(secs)) - (secs-1);
     if(secs2.isNaN || secs2.isInfinite){
       secs2 = 0.0000000001;
     }
    num secs4 = secs2.floor();
    
    //print time left to continue game
    normContext.font = "normal 15pt calibri";
    normContext.fillText('Press Enter to continue... $secs4', 300, 420, 1000);
    normContext.restore();
    
    //if user presses ENTER, restart game
    if (input.isDown(KeyCode.ENTER)) {
      restartGame();
    }
    //load main menu if user does not press ENTER
    else if(restartTimer.elapsedMilliseconds>5000){
      reloadMainMenu();
    }
  }
  
  
  
  // Used for Frames Per Second Debugging Information
  numberOfRenders += 1.0;
}

drawObjects() {
  for (GameObject go in ObjectManager.instance.goList) {
    double goRightEdge = go.x + go.width/2;
    double goLeftEdge = go.x - go.width/2;
    
    if (goRightEdge > (camera.x - (viewportWidth / Camera.instance.screenRatio))  && 
        goLeftEdge < (camera.x + (viewportWidth / Camera.instance.screenRatio))) {
      go.draw();
          DrawColliderBox(go);
        }   
      }
  }

/**
 * Draws textual information around the edges of the screen that does not move with
 * the camera.
 */
drawHUD() {
  normContext.save();
  normContext.fillStyle = 'white';
  normContext.font = "normal 14pt calibri";
  normContext.fillText("BUZZKILL", 10, 20, 100);
  //context.fillText("Score:  ?????", viewportWidth/2 -35, 20, 100);  Do we have score in this game?
  normContext.fillText("Lives: $lives", 10, viewportHeight-15, 100);
  normContext.fillText("Remaining Oxygen: $oxygen", viewportWidth - 200, viewportHeight-15, 500);
  normContext.restore();
  
// Variables for Performance monitoring
  normContext.fillStyle = 'white';
  normContext.font = "normal 8pt calibri";
  normContext.fillText("ups: $updatesPerSecond", 10, 35, 100);
  normContext.fillText("rps: $rendersPerSecond", 10, 50, 100);
  normContext.restore();
}

/**
 * Code to trigger when the game has been won
 */
win() {
  // music to be placed here in the future
  
  state = stateEnumWin;
  
}


collected(){
  state = stateEnumCollected;
}
gameOver() {
  // TODO music to be placed here in the future
  restartTimer = new Stopwatch();
  restartTimer.start();
  currentLevel = LevelManager.enumLevelOne;
  //gameLoop.addTimer((restart) => reloadMainMenu(), 3.0);
 
  state = stateEnumGameOver;
  oxygenTimer.stop();
  oxygenCollected = 0;
}

reloadLevel() {
  levelManager.loadLevel(currentLevel);
  player.resetPlayer();
  
  //reset oxygen
  if(currentLevel >= LevelManager.enumLevelOne){
    oxygenTimer.reset(); lastOxygenTick = 0.0;
    oxygenTimer.start();}
  
  state = stateEnumPlay;
  oxygenCollected = 0;
}

restartGame() {
  currentLevel = 1;
  lives = 3;
  levelManager.loadLevel(currentLevel);
  player.resetPlayer();
  state = stateEnumPlay;
  
  currentLevel = 1;
  //reset oxygen
  if(currentLevel >= LevelManager.enumLevelOne){
    oxygenTimer.reset(); lastOxygenTick = 0.0;
    oxygenTimer.start();}
  
  oxygenCollected = 0;
}

pauseOxygenDrain(){
  if(oxygenTimer.elapsedMilliseconds > 250 + lastOxygenTick){
        lastOxygenTick += 250;
         oxygen -= 0;
      }
}

reloadMainMenu(){
  currentLevel = LevelManager.enumMainMenu;
  state = stateEnumMain;
  Game.instance.resetMainMenu = true;
     Game.instance.menu.playGame = true;
     lives = 3;
     Globals.setBackground();
}

}