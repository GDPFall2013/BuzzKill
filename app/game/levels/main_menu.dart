part of gdp;

class MainMenu extends GameObject{
  
  Input input;
  SpriteSheet sprite;
  double x;
  double y;
  double width;
  double height;
  
  int spritex=0;
  int spritey=0;
  
  bool playGame = false;
  bool options = false;
  bool controls = false;
  
  MainMenu(){
    width = 225.0;
    height = 221.0;
    x = 300.0;
    y = 0.0;
    input = new Input();
    playGame = true;
    sprite = new SpriteSheet("./content/menu.png",spritex,spritey,225,221);
  }

  
  draw(){
    double cx = this.x - camera.x;
    double cy = this.y - camera.y;
    
    sprite.drawOnPosition(cx-this.width/2, cy-this.height/2, 225.0 , 221.0);
  }
  
  
  update(double dt){
    
    //down
    if (input.wasPressed(KeyCode.RIGHT) && playGame){
        playGame = false;
        options = true;
        sprite.spritex = 225;   
      }
      
    else if(input.wasPressed(KeyCode.RIGHT) && options){
        options = false;
        controls = true;
        sprite.spritex = 450;    
      }
      
    if (input.wasPressed(KeyCode.DOWN) && playGame){
      playGame = false;
      options = true;
      sprite.spritex = 225;   
    }
    
    else if(input.wasPressed(KeyCode.DOWN) && options){
        options = false;
        controls = true;
        sprite.spritex = 450;    
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
        sprite.spritex = 225;
      }
     
    if(input.wasPressed(KeyCode.UP) && options){
      options = false;
      playGame = true;
      sprite.spritex = 0;
    }
    
    else if(input.wasPressed(KeyCode.UP) && controls){
        controls = false;
        options = true;
        sprite.spritex = 225;
      }
    
    
    //Select 'Play Game'
    if(input.wasPressed(KeyCode.ENTER) && playGame){
      Game.instance.currentLevel = LevelManager.enumLevelTwo;
      Game.instance.reloadLevel();
    }
    
  }
  
}