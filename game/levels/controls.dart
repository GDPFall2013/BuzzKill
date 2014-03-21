part of gdp;

class Controls extends GameObject{
  
  Input input;
  SpriteSheet sprite;
  double x;
  double y;
  double width;
  double height;
  
  int spritex=0;
  int spritey=0;
  
  bool resume = false;
  bool options = false;
  bool controls = false;
  bool quit = false;
  
  Controls(){
    width = 640.0;
    height = 480.0;
    x = 0.0;
    y = 0.0;
    input = new Input();
    resume = true;
    sprite = new SpriteSheet("./content/controls.png",spritex,spritey,640,480);
  }

  
  draw(){
    if(Game.instance.state == Game.instance.stateEnumControls){
      sprite.drawOnPositionNormal(x, y, 640.0 , 480.0);
   }
  }
  
  
  update(double dt){
    
    
      if (input.wasPressed(KeyCode.BACKSPACE) && Game.instance.state == Game.instance.stateEnumPlay){
           Game.instance.state = Game.instance.stateEnumPause; 
           Game.instance.lastBACK = input.timePressed(KeyCode.BACKSPACE);
           Game.instance.resetMainMenu = true;
         }
      
      
      else if((input.wasPressed(KeyCode.BACKSPACE)) && Game.instance.currentLevel > LevelManager.enumMainMenu){
        Game.instance.state = Game.instance.stateEnumPause;
        Game.instance.lastBACK = input.timePressed(KeyCode.BACKSPACE);
        Game.instance.resetMainMenu = true;
      }
      
      else if (input.wasPressed(KeyCode.BACKSPACE)){
      Game.instance.state = Game.instance.stateEnumMain; 
      Game.instance.resetMainMenu = true;
      Game.instance.lastBACK = input.timePressed(KeyCode.BACKSPACE);

    }
    
    
    
  }
  
}