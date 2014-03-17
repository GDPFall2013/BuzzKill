part of gdp;

class LevelTransition extends GameObject{
  
  Input input;
  SpriteSheet introBG;
  SpriteSheet introText;
  SpriteSheet buzz;
  SpriteSheet buzz2;
  Alien alien;
  Droid droid;
  
  double x; 
  double y;
  double width;
  double height;
  
  double buzz2x;
  
  int spritex=0;
  int spritey=0;
  int repeat = 0; int repeat2 = 0;
  
  LevelTransition(){
    width = 640.0;
    height = 480.0;
    x = 0.0;
    y = 0.0;
    input = new Input();
    alien = new Alien()..initialize(500.0, 0.0);
    droid = new Droid()..initialize(300.0, 0.0);
    
    introBG = new SpriteSheet("./content/intro_bg.png",spritex,spritey,640,480);
    introText = new SpriteSheet("./content/intro_text.png",spritex,spritey,640,480);
    buzz = new SpriteSheet("./content/buzzspritesheet.png",spritex,spritey,75,100);
    buzz2 = new SpriteSheet("./content/buzzspritesheet.png",spritex,spritey,75,100);
    introText.spritey = -400; buzz.spritey = 0; buzz2x=0.0;
  }

  
  draw(){
    
    /**************************************
     ********* draw INTRO screen **********
     **************************************/
    if(Game.instance.state == Game.instance.stateEnumIntro){
      
      introBG.drawOnPositionNormal(0.0, 0.0, width , height);
      
      if(introText.spritey <= 0){
      introText.spritey += 0.12;
      }
      
      else{
        
        if(repeat2 ==0 || repeat2==1 || repeat2==2 || repeat2==3 ||repeat2==4 || repeat2==5 ||repeat2==6
           || repeat2==7 || repeat2==8 ||repeat2==9 || repeat2==10 || repeat2==11 ||repeat2==12){
                  repeat2++;
        }
        
        else if(repeat2==13){
                
          if(buzz2x <= 725){
            if(buzz2.spritex>=850){
             buzz2.spritex = 0;
                               }
            
          buzz2.spritex += 75;
          buzz2x += 37;
          repeat2=0;
        }
          else{
           
           buzz2.spritey = -200;
           if(buzz.spritex>=850){
                     buzz.spritex = 0;
                   }
                   if(repeat ==0 || repeat==1 || repeat==2){
                     repeat++;
                   }
                   else if(repeat==3){
                   buzz.spritex += 75; 
                   repeat=0;
                   }   
          }
         }       
        buzz2.drawOnPosition(buzz2x, 300.0, 75.0 , 100.0);
        buzz.drawOnPosition(800.0, 300.0, 75.0 , 100.0);
      }

      introText.drawOnPositionNormal(0.0, 0.0, width , height);
    }
    
    
    /**************************************
     *****draw level transition screen*****
     **************************************/
    else if(Game.instance.state == Game.instance.stateEnumTransition){
      normContext.fillStyle = 'black';
      normContext.fillRect(0, 0, 640, 480);
      normContext.fillStyle = 'white';
      normContext.font = "normal 30pt calibri";
      
      //level 1 transition
      if(Game.instance.currentLevel == LevelManager.enumMainMenu){
        normContext.fillText('LEVEL ONE', viewportWidth/2 - 70, viewportHeight/2 - 40, 1000);
        alien.draw();
       }
      
      //level 2 transition
      else if(Game.instance.currentLevel == LevelManager.enumLevelOne){
        normContext.fillText('LEVEL TWO', viewportWidth/2 - 70, viewportHeight/2 - 40, 1000);
        droid.draw();
      }
      
      //level 3 transition
      else if(Game.instance.currentLevel == LevelManager.enumLevelTwo){
        normContext.fillText('LEVEL THREE', viewportWidth/2 - 70, viewportHeight/2 - 40, 1000);
      }
      
      //level 4 transition
      else if(Game.instance.currentLevel == LevelManager.enumLevelThree){
        normContext.fillText('LEVEL FOUR', viewportWidth/2 - 70, viewportHeight/2 - 40, 1000);
      }
      
      if(!Game.instance.menu.cheat){
        Game.instance.player.playerStartX = 0.0;
      }
      normContext.font = "normal 15pt calibri";
      normContext.fillText('Press Enter to continue.', 420, 420, 1000);
   }

  }
  
 
  
  
  update(double dt){
    
    //level transition state
    if(Game.instance.state == Game.instance.stateEnumTransition){
      
      if(Game.instance.input.isDown(KeyCode.ENTER)){
        //to avoid reading two 'ENTER' presses as the same keystroke
        if(input.timePressed(KeyCode.ENTER) - Game.instance.lastENTER > 0.0){
          ObjectManager.instance.goList.clear();
          
          Game.instance.currentLevel += 1;
          Game.instance.reloadLevel();
          
        }
      }
      
      //level 1 transition update
      if(Game.instance.currentLevel == LevelManager.enumMainMenu){
        alien.update(dt);
      }
      
      //level 2 transition update
      if(Game.instance.currentLevel == LevelManager.enumLevelOne){
        droid.update(dt);
      }
      
    }
    
    //game intro state
    else if(Game.instance.state == Game.instance.stateEnumIntro){
      if(Game.instance.input.isDown(KeyCode.ENTER) || Game.instance.input.isDown(KeyCode.ESC)){
        
              //to avoid reading two 'ENTER'/'ESC' presses as the same keystroke
              if(input.timePressed(KeyCode.ENTER) - Game.instance.lastENTER > 0.0 ||
                  input.timePressed(KeyCode.ESC) - Game.instance.lastESC > 0.0){
                Game.instance.lastENTER = input.timePressed(KeyCode.ENTER);
                Game.instance.lastESC = input.timePressed(KeyCode.ESC);
                ObjectManager.instance.goList.clear();
                Game.instance.state = Game.instance.stateEnumTransition;
              }
       }
    }
  }
  
}