part of gdp;

class MainMenu extends GameObject{
  
  Input input;
  SpriteSheet sprite;
  SpriteSheet instructions;
  SpriteSheet selectInstructions;
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
  bool exit = false;
  
  bool cheat = false;
  
  
  MainMenu(){
    width = 150.0;
    height = 48.0;
    x = 300.0;
    y = 200.0;
    input = new Input();
    playGame = true;
    sprite = new SpriteSheet("./content/menu.png",spritex,spritey,150,196);
    instructions = new SpriteSheet("./content/instructions.png",0,0,258,114);
    selectInstructions = new SpriteSheet("./content/enter-instructions.png",0,0,258,114);
    //query("#canvas").style.backgroundImage = "url(content/background.jpg)";
    //Game.instance.currentLevel = LevelManager.enumLevel;
    cheat = false;
  }

  
  draw(){
    //print(Game.instance.currentLevel);
    sprite.drawOnPositionNormal(x-this.width/2, y-this.height/2, 150.0 , 196.0);
    

    instructions.drawOnPosition(camera.x+700, camera.y+350, 258.0 , 114.0);
    selectInstructions.drawOnPosition(camera.x+850, camera.y+350, 258.0 , 114.0);
  }
  
  
  update(double dt){
    i = i+1;
    //print("Update main menu");
    //print(i);
    
    //down
    if(Game.instance.state == Game.instance.stateEnumMain){
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
    
    else if(input.wasPressed(KeyCode.RIGHT) && controls){
            controls = false;
            exit = true;
            sprite.spritex = 450;    
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
    
    else if(input.wasPressed(KeyCode.DOWN) && controls){
        controls = false;
        exit = true;
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
        sprite.spritex = 150;
      }
    
    else if(input.wasPressed(KeyCode.LEFT) && exit){
            exit = false;
            controls = true;
            sprite.spritex = 300;
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
    
    else if(input.wasPressed(KeyCode.UP) && exit){
            exit = false;
            controls = true;
            sprite.spritex = 300;
          }
    
    //SELECT 'PLAY GAME'
    if(Game.instance.state == Game.instance.stateEnumMain
        && input.isDown(KeyCode.ENTER) && playGame){
      
      if(input.timePressed(KeyCode.ENTER) - Game.instance.lastENTER > 0.0){
              Game.instance.state = Game.instance.stateEnumIntro;
              //Game.instance.transition.draw();
              playGame = false;
              Game.instance.lastENTER = input.timePressed(KeyCode.ENTER);
              Game.instance.transition = new LevelTransition();
              if(!cheat){
              Game.instance.currentLevel = Game.instance.startLevel;
              }
             }
    }
    
    //SELECT CONTROLS
    else if(controls && input.wasPressed(KeyCode.ENTER)){
       controls = false;
       Game.instance.state = Game.instance.stateEnumControls;
       Game.instance.lastENTER = input.timePressed(KeyCode.ENTER);
       playGame = true;
     }
     
    //SELECT OPTIONS
    else if(options && input.wasPressed(KeyCode.ENTER)){
      options = false;
      playGame = true;
      Game.instance.state = Game.instance.stateEnumOptions;
      Game.instance.lastENTER = input.timePressed(KeyCode.ENTER);
    }
    
    
    //EXIT GAME
    else if(exit && input.wasPressed(KeyCode.ENTER)){
      chrome.app.window.current().close();
    }
    
    /*
    else if(input.wasPressed(KeyCode.ESC)){
      if(input.timePressed(KeyCode.ESC) - Game.instance.lastESC > 0.0){
        chrome.app.window.current().close();
      }
    }*/
    
    
    if(input.wasPressed(KeyCode.NUM_ONE)){
      Game.instance.currentLevel = LevelManager.enumLevelThree;
      Game.instance.state = Game.instance.stateEnumOutro;
      Game.instance.endScene = new EndScene();
      Globals.setBackground();
      cheat=true;
    }
    else if(input.wasPressed(KeyCode.NUM_TWO)){
      Game.instance.currentLevel = LevelManager.enumLevelOne;
      cheat=true;
    }
    else if(input.wasPressed(KeyCode.NUM_THREE)){
      Game.instance.currentLevel = LevelManager.enumLevelTwo;
      cheat=true;
    }
    else if(input.wasPressed(KeyCode.NUM_FOUR)){
      Game.instance.currentLevel = LevelManager.enumLevelThree;
      cheat=true;
    }
    else if(input.wasPressed(KeyCode.NUM_FIVE)){
      Game.instance.currentLevel = LevelManager.enumLevelOne;
      Game.instance.player.playerStartX = 12800.0;
      cheat=true;
    }
    else if(input.wasPressed(KeyCode.NUM_SIX)){
      Game.instance.currentLevel = LevelManager.enumLevelTwo;
      Game.instance.player.playerStartX = 18600.0;
      cheat=true;
    }
    else if(input.wasPressed(KeyCode.NUM_SEVEN)){
      Game.instance.currentLevel = LevelManager.enumLevelThree;
      Game.instance.player.playerStartX = 29000.0;
      cheat=true;
    }
    
  }
  }
  
}