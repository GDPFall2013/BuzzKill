part of gdp;

class Options extends GameObject{
  
  Input input;
  SpriteSheet template;
  SpriteSheet bg;
  SpriteSheet levelSprite;
  SpriteSheet backSprite;
  SpriteSheet soundSprite;
  SpriteSheet difficultySprite;
  SpriteSheet screenSprite;
  double x;
  double y;
  double width;
  double height;
  
  int spritex=0;
  int spritey=0;
  
  bool back = false;
  
  bool soundslc = false; bool soundON = true;
  
  bool difficultyslc = false; 
  bool normalslc = true, normalhover = true, normalhoverslc = false;
  bool easyslc = false, easyhover = false, easyhoverslc = false;
  bool hardslc = false, hardhover = false, hardhoverslc = false;
  
  bool screenslc = false; bool screenFULL = true;
  
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
    difficultySprite = new SpriteSheet("./content/options menu sprite.png",spritex,spritey,465,65);
    screenSprite = new SpriteSheet("./content/options menu sprite.png",spritex,spritey,465,65);
    
      backSprite.spritey = 325;
      difficultySprite.spritey = 390;
      screenSprite.spritey = 1170;
  }

  
  draw(){
    
    if(Game.instance.state == Game.instance.stateEnumOptions){
      bg.drawOnPositionNormal(x, y, 640.0 , 480.0);
      //template.drawOnPositionNormal(x, y, 640.0 , 480.0);
      
      
      //level select only shows in main menu
     if(Game.instance.currentLevel == LevelManager.enumMainMenu){
      levelSprite.drawOnPositionNormal(94.0, 116.0, 380.0 , 70.0);
     }
     
      backSprite.drawOnPositionNormal(40.0, 40.0, 380.0 , 70.0);
      
      soundSprite.drawOnPositionNormal(80.0, 185.0, 380.0 , 70.0);
      difficultySprite.drawOnPositionNormal(80.0,250.0,380.0,70.0);
      screenSprite.drawOnPositionNormal(80.0,315.0,380.0,70.0);
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
      
    
    
    /*=======================================================================================================================*/
    /************************************** BEGIN SOUND SELECT **********************************************************/    
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
    
    /********************************************* END SOUND SELECT **********************************************************/
    /*=======================================================================================================================*/
    
    
    
    
    
    /*=======================================================================================================================*/
    /************************************** BEGIN DIFFICULTY SELECT **********************************************************/
    else if(soundslc && input.wasPressed(KeyCode.DOWN)){
      if(soundON){
        soundOn();
      }
      else{
        soundOff();
      }
      
      if(normalslc){
        normalSelectNormalHover();
      }
      else if(hardslc){
        hardSelectHardHover();
      }
      else if(easyslc){
        easySelectEasyHover();
      }
      
      difficultyslc = true;
      soundslc = false;
    }
    
    else if(difficultyslc){
      //normalslc normalhover -> normalslc hardhover
      if(normalslc && normalhover && input.wasPressed(KeyCode.RIGHT)){
        normalhover = false; hardhover = true; normalslc = true;
        normalSelectHardHover();
      }
      //normalslc hardhover -> normalslc normalhover
      else if(normalslc && hardhover && input.wasPressed(KeyCode.LEFT)){
        normalhover = true; normalslc = true; hardhover = false;
        normalSelectNormalHover();
      }
      //normalslc normalhover -> normalslc easyhover
      else if(normalslc && normalhover && input.wasPressed(KeyCode.LEFT)){
        normalhover = false; normalslc = true; easyhover = true;
        normalSelectEasyHover();
      }
      //normalslc easyhover -> normalslc normalhover
      else if(normalslc && easyhover && input.wasPressed(KeyCode.RIGHT)){
        normalhover = true; normalslc = true; easyhover = false;
        normalSelectNormalHover();
      }
      
      
      
      //hardslc hardhover
      else if(hardhover && input.wasPressed(KeyCode.ENTER)){
        easyslc = false; normalslc = false; hardslc = true; hardhover = true;
        hardSelectHardHover();
        Globals.setHardDifficulty();
      }
      //normalslc normalhover
      else if(normalhover && input.wasPressed(KeyCode.ENTER)){
        easyslc = false; normalslc = true; hardslc = false; normalhover = true;
        normalSelectNormalHover();
        Globals.setNormalDifficulty();
      }
      //easyslc easyhover
      else if(easyhover && input.wasPressed(KeyCode.ENTER)){
        easyslc = true; normalslc = false; hardslc = false; easyhover = true;
        easySelectEasyHover();
        Globals.setEasyDifficulty();
      }
      
      
      
      
      //easyslc easyhover -> easyslc normalhover
      else if(easyslc && easyhover && input.wasPressed(KeyCode.RIGHT)){
        easyhover = false; normalhover = true; easyslc = true;
        easySelectNormalHover();
      }
      //easyslc normalhover -> easyslc hardhover
      else if(easyslc && normalhover && input.wasPressed(KeyCode.RIGHT)){
        normalhover = false; hardhover = true; easyslc = true;
        easySelectHardHover();
      }
      //easyslc hardhover -> easyslc normalhover
      else if(easyslc && hardhover && input.wasPressed(KeyCode.LEFT)){
        hardhover = false; normalhover = true; easyslc = true;
        easySelectNormalHover();
      }
      //easyslc normalhover -> easyslc easyhover
      else if(easyslc && normalhover && input.wasPressed(KeyCode.LEFT)){
        normalhover = false; easyhover = true; easyslc = true;
        easySelectEasyHover();
      }
      
      
      //hardslc hardhover -> hardslc normalhover
      else if(hardslc && hardhover && input.wasPressed(KeyCode.LEFT)){
        hardhover = false; normalhover = true; hardslc = true;
        hardSelectNormalHover();
      }
      //hardslc normalhover -> hardslc easyhover
      else if(hardslc && normalhover && input.wasPressed(KeyCode.LEFT)){
        normalhover = false; easyhover = true; hardslc = true;
        hardSelectEasyHover();
      }
      //hardslc easyhover -> hardslc normalhover
      else if(hardslc && easyhover && input.wasPressed(KeyCode.RIGHT)){
        easyhover = false; normalhover = true; hardslc = true;
        hardSelectNormalHover();
      }
      //hardslc normalhover -> hardslc hardhover
      else if(hardslc && normalhover && input.wasPressed(KeyCode.RIGHT)){
        normalhover = false; hardhover = true; hardslc = true;
        hardSelectHardHover();
      }
      
      
      else if(input.wasPressed(KeyCode.UP)){
        difficultyslc = false; soundslc = true;
        if(hardslc){
          hardSelect();
        }
        else if(normalslc){
          normalSelect();
        }
        else if(easyslc){
          easySelect();
        }
        
        
        if(soundON){
          soundOnHover();
        }
        else{
          soundOffHover();
        }
      }
      
      
      else if(input.wasPressed(KeyCode.DOWN)){
        screenslc = true; difficultyslc = false;
        
        if(screenFULL){
          screenFullHover();
        }
        else{
          screenWindowHover();
        }
        
        
        if(hardslc){
          hardSelect();
        }
        else if(normalslc){
          normalSelect();
        }
        else if(easyslc){
          easySelect();
        }
      }
      
    }

    /************************************** END DIFFICULTY SELECT ************************************************************/
    /*=======================================================================================================================*/
    
    
    
    
    
    /*=======================================================================================================================*/
    /**************************************** BEGIN SCREEN SELECT ************************************************************/
    
    else if(screenslc){
      //screenFull -> screenWindow
      if(screenFULL && input.wasPressed(KeyCode.ENTER)){
        screenWindowHover();
       // toggleFullScreen();
      }
      
      //screenWindow -> screenFull
      else if(!screenFULL && input.wasPressed(KeyCode.ENTER)){
        screenFullHover();
       // toggleFullScreen();
      }
      
      //screenslc -> difficultyslc
      else if(input.wasPressed(KeyCode.UP)){
        screenslc = false; difficultyslc = true;
        if(screenFULL){
          screenFull();
        }
        else{
          screenWindow();
        }
        
        
        if(normalslc){
          normalSelectNormalHover();
        }
        else if(hardslc){
          hardSelectHardHover();
        }
        else if(easyslc){
          easySelectEasyHover();
        }
      }
    }
    
    
    
    /****************************************** END SCREEN SELECT ************************************************************/
    /*=======================================================================================================================*/
    
    
    
    
    /*=======================================================================================================================*/
    /****************************************** EXIT OPTIONS SCREEN **********************************************************/
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
      
     
      else if((input.wasPressed(KeyCode.ESC)) && Game.instance.currentLevel == LevelManager.enumMainMenu){
        Game.instance.state = Game.instance.stateEnumMain;
        Game.instance.resetMainMenu = true;
        Game.instance.lastESC = input.timePressed(KeyCode.ESC);
        reset();
      }
     
      else if (input.wasPressed(KeyCode.ESC)){
        Game.instance.state = Game.instance.stateEnumPause; 
        Game.instance.resetMainMenu = true;
        //Game.instance.gameMenu = new InGameMenu();
        Game.instance.lastESC = input.timePressed(KeyCode.ESC);
        
        reset();
      
    }
  }
  
  /****************************************** EXIT OPTIONS SCREEN **********************************************************/
  /*=======================================================================================================================*/
  
  
  
  
  
  
  /*=======================================================================================================================*/
  /********************************************* UTILITY METHODS ***********************************************************/
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
  
  
  normalSelect(){
    difficultySprite.spritey = 390;
    hardhover = false; normalhover = false; easyhover = false;
  }
  
  easySelect(){
    difficultySprite.spritey = 455;
    hardhover = false; normalhover = false; easyhover = false;
  }
  
  hardSelect(){
    difficultySprite.spritey = 520;
    hardhover = false; normalhover = false; easyhover = false;
  }
  
  normalSelectEasyHover(){
    difficultySprite.spritey = 585;
    easyhover = true;
  }
  
  normalSelectNormalHover(){
    difficultySprite.spritey = 650;
    normalhover = true; normalslc = true;
  }
  
  normalSelectHardHover(){
    difficultySprite.spritey = 715;
    hardhover = true;
  }
  
  easySelectEasyHover(){
    difficultySprite.spritey = 780;
    easyhover = true; easyslc = true;
  }
  
  easySelectNormalHover(){
    difficultySprite.spritey = 845;
    normalhover = true;
  }
  
  easySelectHardHover(){
    difficultySprite.spritey = 910;
    hardhover = true;
  }
  
  hardSelectEasyHover(){
    difficultySprite.spritey = 975;
    easyhover = true;
  }
  
  hardSelectNormalHover(){
    difficultySprite.spritey = 1040;
    normalhover = true;
  }
  
  hardSelectHardHover(){
    difficultySprite.spritey = 1105;
    hardhover = true;
  }
  
  
  
  screenFull(){
    screenSprite.spritey = 1170;
    screenFULL = true;
  }
  
  screenWindow(){
    screenSprite.spritey = 1235;
    screenFULL = false;
  }
  
  screenFullHover(){
    screenSprite.spritey = 1300;
    screenFULL = true;
  }
  
  screenWindowHover(){
    screenSprite.spritey = 1365;
    screenFULL = false;
  }
  
  toggleFullScreen() {
     chrome.AppWindow appWindow = chrome.app.window.current();
     if (appWindow.isFullscreen()){
       appWindow.restore();
     } else {
       appWindow.fullscreen();
     }
   }
}