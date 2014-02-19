part of gdp;

class Options extends GameObject{
  
  Input input;
  SpriteSheet template;
  SpriteSheet bg;
  SpriteSheet levelSprite;
  SpriteSheet backSprite;
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
  bool levelslc = false;
  bool level1slc = false, level2slc=false;
  bool level1hover=false, level2hover=false;
  bool level2hoverslc=false, level1hoverslc=false;
  
  Options(){
    width = 640.0;
    height = 480.0;
    x = 0.0;
    y = 0.0;
    input = new Input();
    back = true;
    template = new SpriteSheet("./content/options2.png",spritex,spritey,640,480);
    levelSprite = new SpriteSheet("./content/options sprite.png",spritex,spritey,380,70);
    backSprite = new SpriteSheet("./content/options sprite.png",spritex,spritey,380,70);
    bg = new SpriteSheet("./content/options_bg.jpg",spritex,spritey,640,480);
    
    

      backSprite.spritey = 700;
  }

  
  draw(){
    
    if(Game.instance.state == Game.instance.stateEnumOptions){
      bg.drawOnPositionNormal(x, y, 640.0 , 480.0);
      template.drawOnPositionNormal(x, y, 640.0 , 480.0);
      
      
     if(Game.instance.currentLevel == LevelManager.enumMainMenu){
      levelSprite.drawOnPositionNormal(94.0, 116.0, 380.0 , 70.0);
     }
     
      backSprite.drawOnPositionNormal(40.0, 40.0, 380.0 , 70.0);
      
      
      
      
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
    //back=true;
    
    
    
    /*******************************************************************************************
     *****************************  BEGIN BETA TESTING CODE (TO SKIP LEVELS) *******************
     *******************************************************************************************/
    if(Game.instance.currentLevel == LevelManager.enumMainMenu){
    if(back && input.wasPressed(KeyCode.DOWN)){
      levelSprite.spritey = 70;
      back = false;
      level1hover = true;
      backSprite.spritey = 630;
      levelslc = true;
      
      if(level1slc){
        level1hover = false;
        level1hoverslc = true;
        levelSprite.spritey = 140;
      }
      else if(level2slc){
        level2hover = false;
        level2hoverslc = true;
        levelSprite.spritey = 420;
      }
    }
    
    if(levelslc){
    if(level1hover && input.wasPressed(KeyCode.ENTER)){
     // if(input.timePressed(KeyCode.ENTER) - Game.instance.lastENTER > 0.0){
        levelSprite.spritey = 140;
    //    Game.instance.lastENTER = input.timePressed(KeyCode.ENTER);
        level1hover = false;
        level1hoverslc = true;
        level1slc = true;
        level2slc = false;
   //   }
      
    }

    if(level1hover && input.wasPressed(KeyCode.RIGHT)){
          levelSprite.spritey = 350;
          level1hover = false;
          level2hover = true;
          
          if(level2slc){
                          levelSprite.spritey =420;
                          level2hover = false;
                          level2hoverslc = true;
                        }
        }
    
    if(level1hoverslc && input.wasPressed(KeyCode.RIGHT)){
      levelSprite.spritey = 280;
      level1hoverslc = false;
      level2hover = true;
    }
   
    if(level2hover && input.wasPressed(KeyCode.ENTER)){
          //if(input.timePressed(KeyCode.ENTER) - Game.instance.lastENTER > 0.0){
            levelSprite.spritey = 420;
         //   Game.instance.lastENTER = input.timePressed(KeyCode.ENTER);
            level2hover = false;
            level2hoverslc = true;
            level2slc = true;
            level1slc = false;
         // }
            
            
     }
    
    if(level2hover && input.wasPressed(KeyCode.LEFT)){
              levelSprite.spritey = 70;
              level2hover = false;
              level1hover = true;
              
              if(level1slc){
                levelSprite.spritey = 140;
                level1hover = false;
                level1hoverslc = true;
              }
            }
    
    if(level2hoverslc && input.wasPressed(KeyCode.LEFT)){
         levelSprite.spritey = 560;
         level2hoverslc = false;
         level1hover = true;
       }
    
    if(levelslc && input.wasPressed(KeyCode.UP)){
      if(level1slc){
        levelSprite.spritey = 210;
      }
      else if(level2slc){
        levelSprite.spritey = 490;
      }
      else{
        levelSprite.spritey = 0;
      }
      backSprite.spritey = 700;
      levelslc = false;
      back = true;
    }
    
    }
    
    }
    
    /*******************************************************************************************
     ***********************    END BETA TESTING CODE (SKIP LEVELS)    *************************
     *******************************************************************************************/  
      
    
    
    
  //down
  //  if(Game.instance.state == Game.instance.stateEnumOptions){
      
     if(back && Game.instance.input.wasPressed(KeyCode.ENTER)){
        
        if(input.timePressed(KeyCode.ENTER) - Game.instance.lastENTER > 0.0 &&
          Game.instance.currentLevel > LevelManager.enumMainMenu){
          Game.instance.state = Game.instance.stateEnumPause;
         //Game.instance.resetMainMenu = true;
          Game.instance.lastENTER = input.timePressed(KeyCode.ENTER);
          reset();
        }
        
        else if(input.timePressed(KeyCode.ENTER) - Game.instance.lastENTER > 0.0 &&
          Game.instance.currentLevel == LevelManager.enumMainMenu){
          Game.instance.state = Game.instance.stateEnumMain;
          Game.instance.resetMainMenu = true;
          Game.instance.lastENTER = input.timePressed(KeyCode.ENTER);
          reset();
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
        reset();
      }
     
      else if (input.wasPressed(KeyCode.ESC) || input.wasPressed(KeyCode.BACKSPACE)){
        Game.instance.state = Game.instance.stateEnumPause; 
        Game.instance.resetMainMenu = true;
        //Game.instance.gameMenu = new InGameMenu();
        Game.instance.lastESC = input.timePressed(KeyCode.ESC);
        
        reset();
      
    }

    
    
    
  }
  
  reset(){
    levelslc = false;
    
    if(level1slc){
      Game.instance.startLevel = LevelManager.enumMainMenu;
      level2slc=false;
      level1hover=false; level2hover=false;
      level2hoverslc=false; level1hoverslc=false;
    }
    
    if(level2slc){
          Game.instance.startLevel = LevelManager.enumLevelOne;
          level1slc=false;
          level1hover=false; level2hover=false;
          level2hoverslc=false; level1hoverslc=false;
        }
    else{
            level2slc=false;level1slc=false;
            level1hover=false; level2hover=false;
            level2hoverslc=false; level1hoverslc=false;
          }
    
                 
  }
  
}