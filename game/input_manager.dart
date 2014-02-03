part of gdp;

/**
 * This class is the interface between Game Loop's input features
 * and what we use in the Game.
 */
class Input {
    Gamepad gp;

    static Input instance;
    static HashMap<int, int> _keys = new HashMap<int, int>();
    factory Input() {
      if (instance == null) {
        instance = new Input._internal();
      }
      return instance;
    }
    
    Input._internal();

    isDown(int keyCode) => gameLoop.keyboard.isDown(keyCode);
    isUp(int keyCode) =>  gameLoop.keyboard.isUp(keyCode);
    wasPressed(int keyCode) => gameLoop.keyboard.pressed(keyCode);
    wasReleased(int keyCode) => gameLoop.keyboard.released(keyCode);
//    wasButtonPressed(int buttonCode) {
//      List gamepads = window.navigator.getGamepads();
//      gp = gamepads.first;
//      if (null != gp) {  
//      // buttons is always equal to null, seems not implemented
//        if(gp.buttons != null) {  
//          
//          return true;
//        }
//      }
//      // again this is always equal to null
//      if (null != gameLoop.gamepad0.buttons) {
//        return true;
//      }
//      
//      return false;
//    }
    
    //wasPressed(gameLoop.GameLoopGamePad.BUTTON0) =>gameLoop.gamepad0;
  /**
   * Check if the given key code is pressed. You should use the [KeyCode] class.
   */
 // isPressed(int keyCode) => _keys.containsKey(keyCode);

  
}