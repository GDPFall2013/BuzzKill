part of gdp;

class Options extends GameObject{
  
  Input input;
  SpriteSheet template;
  SpriteSheet bg;
  SpriteSheet levelSprite;
  SpriteSheet backSprite;
  SpriteSheet soundSprite;
  double x;
  double y;
  double width;
  double height;
  
  int spritex=0;
  int spritey=0;
  
  bool back = false;
  
  bool soundslc = false; bool soundON = true;
  
  bool difficultyslc = false;
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
    //template = new SpriteSheet("./content/options2.png",spritex,spritey,640,480);
    levelSprite = new SpriteSheet("./content/options sprite.png",spritex,spritey,380,70);
    backSprite = new SpriteSheet("./content/options menu sprite.png",spritex,spritey,380,70);
    bg = new SpriteSheet("./content/options_bg.jpg",spritex,spritey,640,480);
    soundSprite = new SpriteSheet("./content/options menu sprite.png",spritex,spritey,465,65);
    

      backSprite.spritey = 325;
  }

  
  draw(){
    
    if(Game.instance.state == Game.instance.stateEnumOptions){
      bg.drawOnPositionNormal(x, y, 640.0 , 480.0);
      //template.drawOnPositionNormal(x, y, 640.0 , 480.0);
      
      
      //only shows in main menu
     if(Game.instance.currentLevel == LevelManager.enumMainMenu){
      levelSprite.drawOnPositionNormal(94.0, 116.0, 380.0 , 70.0);
     }
     
      backSprite.drawOnPositionNormal(40.0, 40.0, 380.0 , 70.0);
      
      soundSprite.drawOnPositionNormal(80.0, 185.0, 380.0 , 70.0);
      
      
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
    
    if(back && input.wasPressed(KeyCode.DOWN) && Game.instance.currentLevel == LevelManager.enumMainMenu){
      levelSprite.spritey = 70;
      back = false;
      level1hover = true;
      backSprite.spritey = 260;
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
    //if(levelslc){
    else if(level1hover && input.wasPressed(KeyCode.ENTER)){
     // if(input.timePressed(KeyCode.ENTER) - Game.instance.lastENTER > 0.0){
        levelSprite.spritey = 140;
    //    Game.instance.lastENTER = input.timePressed(KeyCode.ENTER);
        level1hover = false;
        level1hoverslc = true;
        level1slc = true;
        level2slc = false;
   //   }
      
    }

    else if(level1hover && input.wasPressed(KeyCode.RIGHT)){
          levelSprite.spritey = 350;
          level1hover = false;
          level2hover = true;
          
          if(level2slc){
                          levelSprite.spritey =420;
                          level2hover = false;
                          level2hoverslc = true;
                        }
        }
    
    else if(level1hoverslc && input.wasPressed(KeyCode.RIGHT)){
      levelSprite.spritey = 280;
      level1hoverslc = false;
      level2hover = true;
    }
   
    else if(level2hover && input.wasPressed(KeyCode.ENTER)){
          //if(input.timePressed(KeyCode.ENTER) - Game.instance.lastENTER > 0.0){
            levelSprite.spritey = 420;
         //   Game.instance.lastENTER = input.timePressed(KeyCode.ENTER);
            level2hover = false;
            level2hoverslc = true;
            level2slc = true;
            level1slc = false;
         // }
            
            
     }
    
    else if(level2hover && input.wasPressed(KeyCode.LEFT)){
              levelSprite.spritey = 70;
              level2hover = false;
              level1hover = true;
              
              if(level1slc){
                levelSprite.spritey = 140;
                level1hover = false;
                level1hoverslc = true;
              }
            }
    
    else if(level2hoverslc && input.wasPressed(KeyCode.LEFT)){
         levelSprite.spritey = 560;
         level2hoverslc = false;
         level1hover = true;
       }
    
    else if(levelslc && input.wasPressed(KeyCode.UP)){
      if(level1slc){
        levelSprite.spritey = 210;
      }
      else if(level2slc){
        levelSprite.spritey = 490;
      }
      else{
        levelSprite.spritey = 0;
      }
      backSprite.spritey = 325;
      levelslc = false;
      back = true;
    }

    /*******************************************************************************************
     ***********************    END BETA TESTING CODE (SKIP LEVELS)    *************************
     *******************************************************************************************/  
      
    
    
    else if(back && input.wasPressed(KeyCode.DOWN)){
      unSelectReturn();
      back = false;
      soundslc = true;
      
      if(soundON){
        soundOnHover();
      }
      else{
        soundOffHover();
      }   
      
    }
    
    // levelslc -> sound **beta/mainmenu**
    else if((levelslc && input.wasPressed(KeyCode.DOWN)) || 
            (Game.instance.currentLevel > LevelManager.enumMainMenu && back && input.wasPressed(KeyCode.DOWN))){
     soundslc = true;
     if(level1slc){
       levelSprite.spritey = 210;
     }
     else if(level2slc){
       levelSprite.spritey = 490;
     }
     else{
       levelSprite.spritey = 0;
     }
     reset();
     if(soundON){
            soundOnHover();
          }
     else{
            soundOffHover();
          }      
   }

    
    // sound -> levelslc **beta/mainmenu**
    else if(soundslc && input.wasPressed(KeyCode.UP) && Game.instance.currentLevel == LevelManager.enumMainMenu){
      soundslc = false; back = false;
      levelslc = true;
      if(soundON){
        soundOn();
      }
      else{
        soundOff();
      }      
      
      if(level1slc){
        level1slclevel1hover();
      }
      else if(level2slc){
        level2slclevel1hover();
      }
      else{
        noslclevel1hover();
      }
      //selectReturn();
      
    }
    
    // sound -> return
    else if(soundslc && input.wasPressed(KeyCode.UP) && Game.instance.currentLevel > LevelManager.enumMainMenu){
      soundslc = false;
      levelslc = false;
      back = true;
      if(soundON){
        soundOn();
      }
      else{
        soundOff();
      }
      selectReturn();
    }
    
    //sound OFF
    else if(soundslc && input.wasPressed(KeyCode.ENTER) && soundON){
      soundOffHover();
      SoundManager.instance.toggleMute();
    }
    
    //sound ON
    else if(soundslc && input.wasPressed(KeyCode.ENTER) && !soundON){
      soundOnHover();
      SoundManager.instance.toggleMute();
    }    
    
    
    
    
    
  //down
  //  if(Game.instance.state == Game.instance.stateEnumOptions){
      
     if(back && Game.instance.input.wasPressed(KeyCode.ENTER)){
        
        if(input.timePressed(KeyCode.ENTER) - Game.instance.lastENTER > 0.0 &&
          Game.instance.currentLevel > LevelManager.enumMainMenu){
          Game.instance.state = Game.instance.stateEnumPause;
         //Game.instance.resetMainMenu = true;
          Game.instance.lastENTER = input.timePressed(KeyCode.ENTER);
          reset();
          back = true;
          soundslc = false;
        }
        
        else if(input.timePressed(KeyCode.ENTER) - Game.instance.lastENTER > 0.0 &&
          Game.instance.currentLevel == LevelManager.enumMainMenu){
          Game.instance.state = Game.instance.stateEnumMain;
          Game.instance.resetMainMenu = true;
          Game.instance.lastENTER = input.timePressed(KeyCode.ENTER);
          reset();
          back = true;
          soundslc = false;
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
  
  resetLevel(){
    level1slc=false;level2slc=false;
    level1hover=false; level2hover=false;
    level2hoverslc=false; level1hoverslc=false;
  }
  
  
  selectReturn(){
    backSprite.spritey = 325;
  }
  
  unSelectReturn(){
    backSprite.spritey = 260;
  }
  
  level2slclevel1hover(){
    levelSprite.spritey = 560;
    level1hover = true;
  }
  
  level1slclevel1hover(){
    levelSprite.spritey = 140;
    level1hover = true;
  }
  
  noslclevel1hover(){
    levelSprite.spritey = 70;
    level1hover = true;
  }
  
  selectlevel2(){
    levelSprite.spritey = 420;
  }
  
  soundOn(){
    soundSprite.spritey = 0;
    soundON = true;
  }
  
  soundOff(){
    soundSprite.spritey = 65;
    soundON = false;
  }
  
  soundOnHover(){
    soundSprite.spritey = 130;
    soundON = true;
  }
  
  soundOffHover(){
    soundSprite.spritey = 195;
    soundON = false;
  }
}