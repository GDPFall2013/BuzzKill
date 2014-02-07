part of gdp;

/**
 * The ship item is what Buzz needs to collect to pass the level.  It is an object
 * Not affected by Gravity
 */
class ShipItem extends Item{
  
  SpriteSheet sprite;
  int spriteXInitial = 0;
  int spriteYInitial = 100;
  int spriteWidth = 90;
  int spriteHeight = 90;
  num spriteFrames = 6;
  
  bool glow=true;
  int repeat=1;
  int level;
  
  initialize(double x, double y) {
    super.initialize(x, y);
    this.height = 80.0;
    this.width = 80.0;
    sprite = new SpriteSheet("./content/gameitems.png",
        spriteXInitial,spriteYInitial,spriteWidth,spriteHeight);
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
        
      }
    
    sprite.drawOnPosition(x-this.width/2, y-this.height/2, width , height);   
  }
  
  /*
   * This method to be called when Buzz touches the item
   */
  collect() {
    SoundManager.instance.playSound(SoundManager.enumSoundShipItem);
    Game.instance.win();
  }
}