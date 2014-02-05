part of gdp;

class MainMenu extends GameObject{
  
  Input input;
  SpriteSheet sprite;
  double x;
  double y;
  double width;
  double height;
  
  int i =0;
  
  int spritex=0;
  int spritey=0;
  
  bool playGame = false;
  bool options = false;
  bool controls = false;
  
  MainMenu(){
    width = 150.0;
    height = 49.0;
    x = 300.0;
    y = 200.0;
    input = new Input();
    playGame = true;
    sprite = new SpriteSheet("./content/menu.png",spritex,spritey,150,147);
  }

  
  draw(){
    sprite.drawOnPositionNormal(x-this.width/2, y-this.height/2, 150.0 , 147.0);
  }
  
  
  update(double dt){
    i = i+1;
    //print("Update main menu");
    //print(i);
    
    //down
    if (input.wasPressed(KeyCode.RIGHT) && playGame){
        playGame = false;
        options = true;
        sprite.spritex = 150;   
      }
      
    else if(input.wasPressed(KeyCode.RIGHT) && options){
        options = false;
        controls = true;
        sprite.spritex = 300;    
      }
      
    if (input.wasPressed(KeyCode.DOWN) && playGame){
      playGame = false;
      options = true;
      sprite.spritex = 150;   
    }
    
    else if(input.wasPressed(KeyCode.DOWN) && options){
        options = false;
        controls = true;
        sprite.spritex = 300;    
      }
    
    
    //up
    if(input.wasPressed(KeyCode.LEFT) && options){
        options = false;
        playGame = true;
        sprite.spritex = 0;
      }
      
    else if(input.wasPressed(KeyCode.LEFT) && controls){
        controls = false;
        options = true;
        sprite.spritex = 150;
      }
     
    if(input.wasPressed(KeyCode.UP) && options){
      options = false;
      playGame = true;
      sprite.spritex = 0;
    }
    
    else if(input.wasPressed(KeyCode.UP) && controls){
        controls = false;
        options = true;
        sprite.spritex = 150;
      }
    
    
    //Select 'Play Game'
    if(Game.instance.currentLevel == LevelManager.enumMainMenu && input.wasPressed(KeyCode.ENTER) && playGame){
     // ObjectManager om = ObjectManager.instance;
     // om.clear();
      Game.instance.currentLevel = LevelManager.enumLevelTwo;
      Game.instance.reloadLevel();
      playGame = false;
    }
    
    
    else if(controls && input.wasPressed(KeyCode.ENTER)){
       Game.instance.state = Game.instance.stateEnumControls;
     }
     
    
  }
  
}