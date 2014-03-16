part of gdp;

/**
 * The ship item is what Buzz needs to collect to pass the level.  It is an object
 * Not affected by Gravity
 */
class ShipItem extends Item{
  
  SpriteSheet sprite;
  //ImageElement img = new Element.tag("img");
  SpriteSheet panel;
  SpriteSheet oxygenSprite; 
  SpriteSheet levelSprite;
  
  int spriteXInitial = 0;
  int spriteYInitial = 100;
  int spriteWidth = 90;
  int spriteHeight = 90;
  num spriteFrames = 6;
  Stopwatch timer = new Stopwatch();
  
  int oxygenCounter;
  
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
    
    oxygenSprite = new SpriteSheet("./content/gameitems.png",0,0,50,50);
    
    
    levelSprite.numberOfFrames = 1;
    //img.src = "./content/gameitems.png";
    
    this.initialX = 0;
    this.initialY = 0;
    
    xx=x;
    yy=y;
    
    panel = new SpriteSheet("./content/panel.png",0,0,491,311);
    panel.numberOfFrames = 1;
    oxygenCounter = 0;
    
    
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

             if(this.x >= camera.x+475 || this.y > -60 || this.y<-65){
               if(this.x>= camera.x+475){
             this.x -= 3.5;}
             if(this.y > -60){
             this.y -= 4.5;
             }
             if(this.y < -65){
                this.y += 4.5;
             }
             sprite.scaledw += 0.5; 
             sprite.scaledh += 0.5;
             initialX += 5;}
             else{
               if(Game.instance.currentLevel == LevelManager.enumLevelOne){
               levelSprite.spritex = 491; drawOxygenCollected();}
               else if(Game.instance.currentLevel == LevelManager.enumLevelTwo){
               levelSprite.spritex = 982; drawOxygenCollected();}
               else if(Game.instance.currentLevel == LevelManager.enumLevelThree){
               levelSprite.spritex = 1473; drawOxygenCollected();}
               else if(Game.instance.currentLevel == LevelManager.enumLevelFour){
               levelSprite.spritex = 1964; drawOxygenCollected();}
             }
             
             if(timer.elapsedMilliseconds >= 5000){
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
                     if(this.x >= camera.x+475 || this.y > -60 || this.y<-65){ 
                       if(this.x>= camera.x+475){
                     this.x -= 3.5;}
                     if(this.y > -60){
                        this.y -= 4.5;
                     }
                     if(this.y < -65){
                        this.y += 4.5;
                     }
                    // this.y -= 4.5;
                     sprite.scaledw += 0.5; 
                     sprite.scaledh += 0.5;
                     initialX += 5;
                     }
                     //increment space items collected once moving space item is stationary
                     else{
                       if(Game.instance.currentLevel == LevelManager.enumLevelOne){
                       levelSprite.spritex = 491; drawOxygenCollected();}
                       else if(Game.instance.currentLevel == LevelManager.enumLevelTwo){
                       levelSprite.spritex = 982; drawOxygenCollected();}
                       else if(Game.instance.currentLevel == LevelManager.enumLevelThree){
                       levelSprite.spritex = 1473; drawOxygenCollected();}
                       else if(Game.instance.currentLevel == LevelManager.enumLevelFour){
                       levelSprite.spritex = 1964; drawOxygenCollected();}                       
                     }
                     
                     //timer, after 3 seconds move to next level transition
                    if(timer.elapsedMilliseconds >= 5000){
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
    Game.instance.menu.cheat = false;
  }
  
  
  drawOxygenCollected(){
    
    if(oxygenCounter<Game.instance.oxygenCollected){
      oxygenCounter++;
    }
    
    int o = Game.instance.oxygenCollected;
    oxygenSprite.drawOnPosition(camera.x+500, camera.y+25, width , height);
    normContext.fillStyle = 'white';
    normContext.font = "normal 15pt calibri";
    normContext.fillText("x $oxygenCounter", viewportWidth/2 + 80, viewportHeight/2 + 30 , 1000);
  }
}