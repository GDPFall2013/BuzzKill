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
    timeReleased(int keyCode) => gameLoop.keyboard.timeReleased(keyCode);
    timePressed(int keyCode) => gameLoop.keyboard.timePressed(keyCode);
    /**
     * This section is Dart code that should work, but is not implemented in Dart yet
     */
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
    bool controllerButtonPushed = false;
    bool controllerAxesRight = false;
    bool controllerAxesLeft = false;
    
    void update() {

      JsObject jsControllers = context['controllers'];
      LinkedHashMap controllers = convert(jsControllers);
      
      controllers.forEach((index, controller) {
        List buttons = controller["buttons"];
        for (var button in buttons){
          if (button == 1){
            controllerButtonPushed = true;
          }
        }
        List axes = controller["axes"];
        var axeOne = axes[0];
        var axeTwo = axes[1];
        var axeThree = axes[2];
        var axeFour = axes[3];
       if (axeOne > 0.5) {
         controllerAxesRight = true;
       }
       if (axeOne < -0.5) {
         controllerAxesLeft = true;
       }
       
      });
    }
    
    convert( JsObject object )
    {
      return JSON.decode( context['JSON'].callMethod("stringify", [ object ] ) );
    }
    
    
    //wasPressed(gameLoop.GameLoopGamePad.BUTTON0) =>gameLoop.gamepad0;
  /**
   * Check if the given key code is pressed. You should use the [KeyCode] class.
   */
 // isPressed(int keyCode) => _keys.containsKey(keyCode);

  
}