part of gdp;

/**
 * The ship item is what Buzz needs to collect to pass the level.  It is an object
 * Not affected by Gravity
 */
class ShipItem extends Item{
  
  SpriteSheet sprite;
  //ImageElement img = new Element.tag("img");
  SpriteSheet panel;
  
  SpriteSheet levelSprite;
  
  int spriteXInitial = 0;
  int spriteYInitial = 100;
  int spriteWidth = 90;
  int spriteHeight = 90;
  num spriteFrames = 6;
  Stopwatch timer = new Stopwatch();
  
  
  bool glow=true;
  bool collected = false;
  
  int repeat=1;
  int level;
  num initialX;
  num initialY;
  num xx;
  num yy;
  
  initialize(double x, double y) {
    super.initialize(x, y);
    this.height = 80.0;
    this.width = 80.0;
    sprite = new SpriteSheet("./content/gameitems.png",
        spriteXInitial,spriteYInitial,spriteWidth,spriteHeight);
    
    levelSprite = new SpriteSheet("./content/panel_level.png",
            0,0,491,311);
    levelSprite.numberOfFrames = 1;
    //img.src = "./content/gameitems.png";
    
    this.initialX = 0;
    this.initialY = 0;
    
    xx=x;
    yy=y;
    
    panel = new SpriteSheet("./content/panel.png",0,0,491,311);
    panel.numberOfFrames = 1;
    
    
    
    if(Game.instance.currentLevel == LevelManager.enumLevelOne){
    levelSprite.spritex = 0;}
    else if(Game.instance.currentLevel == LevelManager.enumLevelTwo){
    levelSprite.spritex = 491;}
    else if(Game.instance.currentLevel == LevelManager.enumLevelThree){
    levelSprite.spritex = 982;}
    else if(Game.instance.currentLevel == LevelManager.enumLevelFour){
    levelSprite.spritex = 1473;} 
    
  }

  
  update(double dt) {
    //Inanimate object, does nothing
  }
  
  
  draw() {
    
    
    
    //glow logic
      if(sprite.spritex >=450){
        glow = false;
      }
      else if(sprite.spritex == 0){
        glow = true;
      }
      
    //reduce glow  
    if(!glow){
      //repeating a single sprite for smoother animation
      if((repeat==1 || repeat==2 || repeat == 3 || repeat ==4 || repeat ==5
              || repeat==6 || repeat==7 || repeat==8)){
        if(repeat == 1){
          repeat = 2;
        }
        else if(repeat == 2){
          repeat = 3;
        }
        else if(repeat == 3){
          repeat = 4;
        }
        else if(repeat == 4){
          repeat = 5;
        }
        else if(repeat == 5){
          repeat = 6;
        }
        else if(repeat == 6){
          repeat = 7;
        }
        else if(repeat == 7){
          repeat = 8;
        }
        else if(repeat == 8){
          repeat = 9;
        }}
        else{  
          repeat=1;
          sprite.spritex -= 90;
        }
    
      if(collected){
        panel.drawOnPosition(xx+300, yy-200, 491.0 , 311.0); 
        levelSprite.drawOnPosition(xx+300, yy-200, 491.0 , 311.0); 
        timer.start();

             if(initialX <= 400){
             this.x -= 1;
             this.y -= 4.5;
             sprite.scaledw += 0.5; 
             sprite.scaledh += 0.5;
             initialX += 5;}
             else{
               if(Game.instance.currentLevel == LevelManager.enumLevelOne){
               levelSprite.spritex = 491;}
               else if(Game.instance.currentLevel == LevelManager.enumLevelTwo){
               levelSprite.spritex = 982;}
               else if(Game.instance.currentLevel == LevelManager.enumLevelThree){
               levelSprite.spritex = 1473;}
               else if(Game.instance.currentLevel == LevelManager.enumLevelFour){
               levelSprite.spritex = 1964;}
             }
             
             if(timer.elapsedMilliseconds >= 4000){
               Game.instance.win();
             }
      }
      
      else{
        xx = camera.x;
        yy = camera.y;
      }
    }

    //increase glow
      else{
        glow = true;
        //repeating a single sprite for smoother animation
        if((repeat==1 || repeat==2 || repeat == 3 || repeat ==4 || repeat ==5
            || repeat==6 || repeat==7 || repeat==8)){
        
        if(repeat == 1){
          repeat = 2;
        }
        else if(repeat == 2){
          repeat = 3;
        }
        else if(repeat == 3){
          repeat = 4;
        }
        else if(repeat == 4){
          repeat = 5;
        }
        else if(repeat == 5){
          repeat = 6;
        }
        else if(repeat == 6){
          repeat = 7;
        }
        else if(repeat == 7){
          repeat = 8;
        }
        else if(repeat == 8){
          repeat = 9;
        }}
        else{  
          repeat=1;
          sprite.spritex += 90;
        }
        
        if(collected){
          panel.drawOnPosition(xx+300, yy-200, 491.0 , 311.0);
          levelSprite.drawOnPosition(xx+300, yy-200, 491.0 , 311.0);
          
                timer.start();
                
                     //move space item
                     if(initialX <= 400){ 
                     this.x -= 1;
                     this.y -= 4.5;
                     sprite.scaledw += 0.5; 
                     sprite.scaledh += 0.5;
                     initialX += 5;
                     }
                     //increment space items collected once moving space item is stationary
                     else{
                       if(Game.instance.currentLevel == LevelManager.enumLevelOne){
                       levelSprite.spritex = 491;}
                       else if(Game.instance.currentLevel == LevelManager.enumLevelTwo){
                       levelSprite.spritex = 982;}
                       else if(Game.instance.currentLevel == LevelManager.enumLevelThree){
                       levelSprite.spritex = 1473;}
                       else if(Game.instance.currentLevel == LevelManager.enumLevelFour){
                       levelSprite.spritex = 1964;}                       
                     }
                     
                     //timer, after 3 seconds move to next level transition
                    if(timer.elapsedMilliseconds >= 4000){
                       Game.instance.win();                     
                       }
              }
        
        else{
                xx = camera.x;
                yy = camera.y;
              }
      
    }

     
    
    sprite.drawOnPosition(x-this.width/2, y-this.height/2, width , height);   
  }
  
  /*
   * This method to be called when Buzz touches the item
   */
  collect() {
    SoundManager.instance.playSound(SoundManager.enumSoundShipItem);
    collected = true;
    Game.instance.collected();
  }
}