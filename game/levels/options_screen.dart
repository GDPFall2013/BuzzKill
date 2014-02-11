part of gdp;

class Options extends GameObject{
  
  Input input;
  SpriteSheet sprite;
  SpriteSheet bg;
  double x;
  double y;
  double width;
  double height;
  
  int spritex=0;
  int spritey=0;
  
  bool back = false;
  bool sound = false;
  bool difficulty = false;
  bool screen = false;
  
  Options(){
    width = 640.0;
    height = 480.0;
    x = 0.0;
    y = 0.0;
    input = new Input();
    back = true;
    sprite = new SpriteSheet("./content/options.png",spritex,spritey,640,480);
    bg = new SpriteSheet("./content/options_bg.jpg",spritex,spritey,640,480);
  }

  
  draw(){
    
    if(Game.instance.state == Game.instance.stateEnumOptions){
      bg.drawOnPositionNormal(x, y, 640.0 , 480.0);
      sprite.drawOnPositionNormal(x, y, 640.0 , 480.0);
   }
    /*
   else{
      sprite.drawOnPosition(x-this.width/2, y-this.height/2, 0.0 , 0.0);
    }
    */
  }
  
  
  update(double dt){
    
   /* if(Game.instance.state == Game.instance.stateEnumPlay && input.wasPressed(KeyCode.ENTER)){
      Game.instance.state = Game.instance.stateEnumPause;
      */
    back=true;
    


    
    
    
    
    
      
  //down
  //  if(Game.instance.state == Game.instance.stateEnumOptions){
      
     if(back && Game.instance.input.wasPressed(KeyCode.ENTER)){
        
        if(input.timePressed(KeyCode.ENTER) - Game.instance.lastENTER > 0.0 &&
          Game.instance.currentLevel > LevelManager.enumMainMenu){
          Game.instance.state = Game.instance.stateEnumPause;
         //Game.instance.resetMainMenu = true;
          Game.instance.lastENTER = input.timePressed(KeyCode.ENTER);
        }
        
        else if(input.timePressed(KeyCode.ENTER) - Game.instance.lastENTER > 0.0 &&
          Game.instance.currentLevel == LevelManager.enumMainMenu){
          Game.instance.state = Game.instance.stateEnumMain;
          Game.instance.resetMainMenu = true;
          Game.instance.lastENTER = input.timePressed(KeyCode.ENTER);
        }

      }
     /* 
      else 
    
    if (input.wasPressed(KeyCode.ESC) && Game.instance.state == Game.instance.stateEnumPlay){
       
           Game.instance.state = Game.instance.stateEnumPause; 
           //normContext.clearRect(x, y, width, height);
           Game.instance.resetMainMenu = true;
           Game.instance.lastESC = input.timePressed(KeyCode.ESC);
         }
      */
      
      else if((input.wasPressed(KeyCode.ESC) || input.wasPressed(KeyCode.BACKSPACE)) &&
        Game.instance.currentLevel == LevelManager.enumMainMenu){
        Game.instance.state = Game.instance.stateEnumMain;
        Game.instance.resetMainMenu = true;
        Game.instance.lastESC = input.timePressed(KeyCode.ESC);
      }
     
      else if (input.wasPressed(KeyCode.ESC) || input.wasPressed(KeyCode.BACKSPACE)){
        Game.instance.state = Game.instance.stateEnumPause; 
        Game.instance.resetMainMenu = true;
        //Game.instance.gameMenu = new InGameMenu();
        Game.instance.lastESC = input.timePressed(KeyCode.ESC);
      
    }

    
    
    
  }
  
}