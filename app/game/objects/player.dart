part of gdp;



class Player extends GameObject{
  
  ImageElement img = new ImageElement();

  Input input;
  bool JUMPING = false;
  bool WALKING = false;
  bool LOOK_RIGHT = false;
  bool LOOK_LEFT = false;
  
  double velocity_y = 0.0;
  double accel = 1.5;
  static double GROUND_LEVEL = 300.0;
  SpriteSheet sprite;
  
  int stateEnumAlive = 1;
  int stateEnumInjured = 2;
  int stateEnumDead = 3;
  
  
  int state;
  
  double invincibilityTimer = 0.0;
  bool blink = false;
  
  double playerStartX = 0.0;  //TODO: This should be moved to level object later
  double playerStartY = 300.0; 
  
  CollisionSystem collision = new CollisionSystem(); //utilized for testing purposes
  
  double imgXOffset = 16.0;
  double imgYOffset = - 12.0;
  
  Player(){
    state = stateEnumAlive;
    x = playerStartX;
    y = playerStartY;
    width = 46.0;
    height = 78.0;
    img = new Element.tag("img");
    img.src = "./content/buzz.png";

    input = new Input();
    sprite = new SpriteSheet("./content/buzzspritesheet.png",0,0,75,100);
    //WALKING = true;
    //print("begin");
    
  }
  
   draw(){
     
     if (state == stateEnumDead || blink) {
       // don't draw
     } else {
       
       double cx = this.x - camera.x;
       double cy = this.y - camera.y;
      //context.drawImageScaled(img, cx - width/2, cy - height/2, width, height);
       
       
       if(JUMPING && LOOK_RIGHT){
  
          sprite.spritex = 225;
          sprite.spritey = 200;
  
         sprite.drawOnPosition((cx-width/2) - imgXOffset, cy - height/2 + imgYOffset, width , height);
         
       }
       
       else if(JUMPING && LOOK_LEFT){
        
           sprite.spritex = 225;
           sprite.spritey = 300;
  
         sprite.drawOnPosition((cx-width/2)  + imgXOffset, cy - height/2 + imgYOffset, width , height);
       }
  
       else if(WALKING && LOOK_RIGHT){
         if(sprite.spritex >= 825){
           sprite.spritex = 0;
           sprite.spritey = 0;
         }
         else{
         sprite.spritex = sprite.spritex + 75;
         sprite.spritey = 0;
         }
         
         //print(sprite.spritex  + sprite.spritey);
         sprite.drawOnPosition((cx-width/2)  - imgXOffset, cy - height/2 + imgYOffset, width , height);
       }
       
       else if(WALKING && LOOK_LEFT){
         if(sprite.spritex <= 0){
           sprite.spritex = 825;
           sprite.spritey = 100;
         }
         else{
         sprite.spritex = sprite.spritex - 75;
         sprite.spritey = 100;
         }
         sprite.drawOnPosition((cx-width/2)  + imgXOffset, cy - height/2 + imgYOffset, width , height);
       }
       
       else {
         if(LOOK_LEFT){
           sprite.spritex = 825;
           sprite.spritey = 100;
           sprite.drawOnPosition((cx-width/2)  + imgXOffset, cy - height/2 + imgYOffset, width , height);
         }
         else{ // Look Right
           sprite.spritex = 0;
           sprite.spritey = 0;
           sprite.drawOnPosition((cx-width/2)  - imgXOffset, cy - height/2 + imgYOffset, width , height);
         }
         
         
       }
     }
  }
   
   update(double dt){
     
     //TODO: When checking for injury, should not be affected if 
     // state = stateEnumInjured
     
     
     if (input.isDown(KeyCode.UP)){
       
       //if currently jumping
       if(JUMPING){
         //do nothing 
       }
       
       //start jump motion
       else{
       SoundManager.instance.playSound(SoundManager.enumSoundJump);
       JUMPING = true;
       velocity_y = 25.0;}

     }
   
     
     //down key does nothing for now
     if (input.isDown(KeyCode.DOWN)){
       //y += 1;    
     }
     
     //move right
     if (input.isDown(KeyCode.RIGHT)){
       x += 3 * dt;
       WALKING = true;
       LOOK_RIGHT = true;
       LOOK_LEFT = false;
       
     }
     
     else{
       WALKING = false;
       //LOOK_RIGHT = false;
     }
     
     //move left
     if (input.isDown(KeyCode.LEFT)){
       x -= 3 * dt;
       WALKING = true;
       LOOK_LEFT = true;
       LOOK_RIGHT = false;
     }
     else{
       if(!WALKING){
       WALKING = false;}
       //LOOK_LEFT = false;
     }
     
       
     //if in jumping motion
     if(JUMPING){
       
         if(velocity_y > - 130.0){
            velocity_y = velocity_y - accel;
            y = y - velocity_y * dt;// - 50);
        //    x += 1;  ?
         }
       }
       
     /* if(y >= GROUND_LEVEL)
      {
         velocity_y = 0.0;
         JUMPING = false;
         y = 300.0;
       }*/
     
      //Check for death 
      if (Game.oxygen <= 0 || this.y > viewportHeight + this.height /2) {
        Game.lives -= 1;
        Game.oxygen = 100.0;
        if (Game.lives <= 0) {
         Game.instance.gameOver();
        }
        // TODO: play some music
        // TODO: wait a few seconds
        camera.x = 0.0;
        camera.y = 0.0;
        
        this.x = playerStartX;
        this.y = playerStartY;
        
        state = stateEnumAlive;
      }
      
      collision.PlayerCollideWithItem(this);
      if (state == stateEnumAlive) {
        collision.PlayerCollideWithEnemy(this);
      }
      collision.PlayerCollideWithBlock(this);
       
   }
  
   injureBuzz (double injuryAmount) {
     Game.oxygen -= injuryAmount;
     // TODO: Play sound
     state = stateEnumInjured;
     invincibilityTimer = 1.5;
     blink = true;
     gameLoop.addTimer((invincibilityTimer) => invincibilityCountDown(), 0.1);
   }
   
   invincibilityCountDown() {
     if (invincibilityTimer > 0) {
       invincibilityTimer -= 0.10;
       blink = !blink;
       gameLoop.addTimer((invincibilityTimer) => invincibilityCountDown(), 0.10);
     } else {
       state = stateEnumAlive;
     }
   }
   
}