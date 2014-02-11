part of gdp;

class InGameMenu extends GameObject{
  
  Input input;
  SpriteSheet sprite;
  double x;
  double y;
  double width;
  double height;
  
  int spritex=0;
  int spritey=196;
  
  bool resume = false;
  bool options = false;
  bool controls = false;
  bool quit = false;
  
  InGameMenu(){
    width = 150.0;
    height = 48.0;
    x = 300.0;
    y = 200.0;
    input = new Input();
    resume = true;
    sprite = new SpriteSheet("./content/menu.png",spritex,spritey,150,198);
  }

  
  draw(){
    if(Game.instance.state == Game.instance.stateEnumPause){
      sprite.drawOnPositionNormal(x-this.width/2, y-this.height/2, 150.0 , 198.0);
   }
  //  else{
      //sprite.drawOnPositionn(x-this.width/2, y-this.height/2, 0.0 , 0.0);
  //  }
  }
  
  
  update(double dt){
    
   /* if(Game.instance.state == Game.instance.stateEnumPlay && input.wasPressed(KeyCode.ENTER)){
      Game.instance.state = Game.instance.stateEnumPause;
      */
      
      
      
  //down
    if(Game.instance.state == Game.instance.stateEnumPause){
  if (input.wasPressed(KeyCode.RIGHT) && resume){
      resume = false;
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
          quit = true;
          sprite.spritex = 450;    
        }
    
  if (input.wasPressed(KeyCode.DOWN) && resume){
    resume = false;
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
      quit = true;
      sprite.spritex = 450;    
    }
  
  
  
  //up
  if(input.wasPressed(KeyCode.LEFT) && options){
      options = false;
      resume = true;
      sprite.spritex = 0;
    }
    
  else if(input.wasPressed(KeyCode.LEFT) && controls){
      controls = false;
      options = true;
      sprite.spritex = 150;
    }
  
  else if(input.wasPressed(KeyCode.LEFT) && quit){
      quit = false;
      controls = true;
      sprite.spritex = 300;
    }
   
  if(input.wasPressed(KeyCode.UP) && options){
    options = false;
    resume = true;
    sprite.spritex = 0;
  }
  
  else if(input.wasPressed(KeyCode.UP) && controls){
      controls = false;
      options = true;
      sprite.spritex = 150;
    }
  
  else if(input.wasPressed(KeyCode.UP) && quit){
      quit = false;
      controls = true;
      sprite.spritex = 300;
    }
  
  
  
  //Select 'Resume'
  if(resume && input.wasPressed(KeyCode.ENTER)){
    Game.instance.state = Game.instance.stateEnumPlay;
    Game.instance.lastENTER = input.timePressed(KeyCode.ENTER);
    Game.instance.resetMainMenu = true;
  }
  
  else if(input.wasPressed(KeyCode.ESC)){
    if(input.timePressed(KeyCode.ESC) - Game.instance.lastESC > 0.0){
      Game.instance.lastESC = input.timePressed(KeyCode.ESC);
      Game.instance.state = Game.instance.stateEnumPlay;
      Game.instance.resetMainMenu = true;
    }
  }
  
  else if(controls && input.wasPressed(KeyCode.ENTER)){
    Game.instance.state = Game.instance.stateEnumControls;
    Game.instance.lastENTER = input.timePressed(KeyCode.ENTER);
    Game.instance.resetMainMenu = true;
    //normContext.save();
  }
  
  else if(options && input.wasPressed(KeyCode.ENTER)){
        options = false;
        resume = true;
        Game.instance.state = Game.instance.stateEnumOptions;
        Game.instance.lastENTER = input.timePressed(KeyCode.ENTER);
        Game.instance.resetMainMenu = true;
        //print(Game.instance.lastENTER);
      }
  
  else if(quit && input.wasPressed(KeyCode.ENTER)){
    //ObjectManager.instance.goList.clear();
    //normContext.clearRect(0, 0,640, 480);
    //sprite.drawOnPositionNormal(x-this.width/2, y-this.height/2, 0.0 , 0.0);
    Game.instance.currentLevel = LevelManager.enumMainMenu;
    Game.instance.state = Game.instance.stateEnumMain;
    Game.instance.lastENTER = input.timePressed(KeyCode.ENTER);
    Game.instance.resetMainMenu = true;
    Game.instance.menu.playGame = true;

  }
  
    }
    
    
    
  }
  
}