library gdp;

import 'dart:html';
import 'dart:collection';

//import 'packages/js/js.dart' as js;
import 'package:game_loop/game_loop_html.dart';
import '../packages/simple_audio/simple_audio.dart';

part 'game/game.dart';
part 'game/input_manager.dart';
part 'game/object_manager.dart';
part 'game/sound_manager.dart';

part 'game/objects/game_object.dart';
part 'game/objects/block.dart';
part 'game/objects/player.dart';
part 'game/objects/alien.dart';


// Global Variables  ******
// Canvas and context are available anywhere for drawing purposes
CanvasRenderingContext2D context;
var canvas;
// Size of the Canvas is only set once, but size should be 
// Readable from anywhere
final int viewportWidth = 640, 
      viewportHeight = 480;

//The Game Loop
GameLoopHtml gameLoop = new GameLoopHtml(canvas);

/* 
 *  Does initial setup, creates the game, and starts the Game Loop
 */
void main() {
  buildCanvas();

  Game game = new Game();
  
  gameLoop.onUpdate = ((gameLoop) {
    // Update Game Logic Here
  //  print('${gameLoop.frame}: ${gameLoop.gameTime} [dt = ${gameLoop.dt}].');
    game.update(gameLoop.dt);
  });
  gameLoop.onRender = ((gameLoop){
    // Draw game into canvasElement using WebGL or CanvasRenderingContext here.
    // The interpolation factor can be used to draw correct inter-frame
    //print('Interpolation factor: ${gameLoop.renderInterpolationFactor}');
  game.draw();
  });
  gameLoop.start();
  
  //var timers = gameLoop.addTimer((timer) => print('timer fired.'), 0.5);
}

/**
 * Does some standard setup for the Canvas element.
 */
void buildCanvas(){
  canvas = query('canvas');
  canvas.width = viewportWidth;
  
  canvas.height = viewportHeight;
  document.body.nodes.add(canvas);
  context = canvas.getContext("2d");
}