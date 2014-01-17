library camera;

import 'dart:html';
part 'adjusted_context.dart';

/**
 *  The Camera class is a singleton that represents what piece of the world is being
 *  shown at a given time.  This is used to deterime position on the screen, and also 
 *  what objects should be drawn.
 */
class Camera {
  
  static Camera instance;
  
  factory Camera() {
    if (instance == null) {
      instance = new Camera._internal();
    }
    return instance;
  }
  
  Camera._internal();
  
  double x = 0.0;
  double y = 0.0;
  
  double screenRatio = 0.5;
}