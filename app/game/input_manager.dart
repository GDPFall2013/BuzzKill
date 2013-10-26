part of gdp;

/**
 * This class is the interface between Game Loop's input features
 * and what we use in the Game.
 */
class Input {
  

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
    
  /**
   * Check if the given key code is pressed. You should use the [KeyCode] class.
   */
 // isPressed(int keyCode) => _keys.containsKey(keyCode);

  
}