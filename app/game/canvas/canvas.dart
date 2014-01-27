library canvas;

import 'dart:html';
part 'adjusted_context.dart';
part 'camera.dart';



// Global Variables  ******
// Canvas and context are available anywhere for drawing purposes
//CanvasRenderingContext2D context;
AdjustedContext context;
CanvasRenderingContext2D normContext;

var canvas;
// Size of the Canvas is only set once, but size should be 
// Readable from anywhere
final int viewportWidth = 640, 
      viewportHeight = 480;

// The camera is a singleton and should be accessible anywhere
Camera camera = new Camera();

/**
 * Does some standard setup for the Canvas element.
 */
void buildCanvas(){
  context = new AdjustedContext(viewportWidth, viewportHeight, camera.screenRatio);
  canvas = query('canvas');
  canvas.width = viewportWidth;
  canvas.height = viewportHeight;
  context.context = canvas.getContext("2d");
  normContext = canvas.getContext("2d");
}