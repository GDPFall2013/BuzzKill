part of gdp;

class Player extends GameObject{
  
  ImageElement img = new ImageElement();

  Input input;
  bool JUMPING = false;
  bool WALKING = false;
  bool LOOK_RIGHT = false;
  bool LOOK_LEFT = false;
  bool ATTACKED = false;
  
  double velocity_y = 0.0;
  double accel = 1.5;
  SpriteSheet sprite;
  
  int stateEnumAlive = 1;
  int stateEnumInjured = 2;
  int stateEnumDead = 3;
  
  int state;
  
  double invincibilityTimer = 0.0;
  bool blink = false;
  
  double playerStartX = 0.0;  //TODO: This should be moved to level object later
  double playerStartY = 300.0; 
  double originalX;
  
  double imgXOffset = 16.0;
  double imgYOffset = - 12.0;
  
  Player(){
    state = stateEnumAlive;
    x = playerStartX;
    y = playerStartY;
    width = 46.0;
    height = 78.0;
    img = new Element.tag("img");

    input = new Input();
    sprite = new SpriteSheet("./content/buzzspritesheet.png",0,0,75,100);
    
  }
  
   draw(){
      if (state != stateEnumDead && !blink && !ATTACKED && Game.instance.state != Game.instance.stateEnumCollected) {
        if(JUMPING && LOOK_RIGHT){
          sprite.spritex = 225;
          sprite.spritey = 200;
          sprite.drawOnPosition((x-width/2) - imgXOffset, y - height/2 + imgYOffset, width , height);
          
        }
        else if(JUMPING && LOOK_LEFT){
          sprite.spritex = 225;
          sprite.spritey = 300;
          sprite.drawOnPosition((x-width/2)  - imgXOffset, y - height/2 + imgYOffset, width , height);
          
       }
       else if(JUMPING){
         sprite.spritex = 225;
         sprite.spritey = 200;
         sprite.drawOnPosition((x-width/2) - imgXOffset, y - height/2 + imgYOffset, width , height);
         
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
         
         sprite.drawOnPosition((x-width/2)  - imgXOffset, y - height/2 + imgYOffset, width , height);
         
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
         sprite.drawOnPosition((x-width/2)  - imgXOffset, y - height/2 + imgYOffset, width , height);
       }
       
      else {
         if(LOOK_LEFT){
           sprite.spritex = 825;
           sprite.spritey = 100;
           sprite.drawOnPosition((x-width/2)  - imgXOffset, y - height/2 + imgYOffset, width , height);
         }
         else{ // Look Right
           sprite.spritex = 0;
           sprite.spritey = 0;
           sprite.drawOnPosition((x-width/2)  - imgXOffset, y - height/2 + imgYOffset, width , height);
         }
      }
    }
  }
   
   update(double dt){
     
     if (state != stateEnumDead && !ATTACKED && Game.instance.state != Game.instance.stateEnumCollected) {
       
       if (input.isDown(KeyCode.UP) || input.controllerButtonPushed){
          if(!JUMPING){
           SoundManager.instance.playSound(SoundManager.enumSoundJump);
           JUMPING = true;
           velocity_y = 25.0;
          }
       }
       
       //move right
       if (input.isDown(KeyCode.RIGHT) || input.controllerAxesRight){
         double movementSpeed;
         if (input.controllerAxesRight){
           movementSpeed = 3.5;
         } else {
           movementSpeed = 3.0;
         }
         movePlayer(1.0, movementSpeed*dt);
         WALKING = true;
         LOOK_RIGHT = true;
         LOOK_LEFT = false;
         
     
       }
       
       else{
         WALKING = false;
         //LOOK_RIGHT = false;
       }
       
       //move left
       if (input.isDown(KeyCode.LEFT) || input.controllerAxesLeft){
         double movementSpeed;
         if (input.controllerAxesLeft){
           movementSpeed = 3.5;
         } else {
           movementSpeed = 3.0;
         }
         movePlayer(-1.0, 3*dt);
         WALKING = true;
         LOOK_LEFT = true;
         LOOK_RIGHT = false;
       }
       else{
         if(!WALKING){
         WALKING = false;}
         
         //LOOK_LEFT = false;
       }

         //Gravity
         if(velocity_y > - 130.0){
            velocity_y = velocity_y - accel;
            y = y - velocity_y * dt;
            
            if(LOOK_RIGHT && input.isDown(KeyCode.RIGHT)){
            movePlayer (1.0, 1 * dt);
            }
            else if(LOOK_LEFT && input.isDown(KeyCode.LEFT)){
            movePlayer(1.0, -1 * dt);
            }
         }
         
       
        //Check for death 
        if ((Game.oxygen <= 0 || this.y > viewportHeight + this.height /2) 
            && state != stateEnumDead) {
          Game.lives -= 1;
          state = stateEnumDead;
          ATTACKED = false;
          if (Game.lives <= 0) {
           Game.instance.gameOver();
          } else {
            // TODO: play some death music
            gameLoop.addTimer((reload) => Game.instance.reloadLevel(), 2.0);
          }
        }
        
      //  if (state == stateEnumAlive || state == stateEnumInjured) {
          CollisionSystem.instance.PlayerCollideWithItem(this);
          CollisionSystem.instance.PlayerCollideWithTrigger(this);
       // }
        if (state == stateEnumAlive) {
          CollisionSystem.instance.PlayerCollideWithEnemy(this);
        }
        CollisionSystem.instance.PlayerCollideWithBlock(this);
     }
       
   }
   
   /**
    *  Takes player commands for movement and  checks to see if that
    *  movement should be blocked.  If it is, it undoes the movement
    */
   movePlayer(double direction, double amount) {
     //move, then check if player is colliding with stuff.  If he is, move him back.
       this.x += direction * amount;
       for (Block block in ObjectManager.instance.blockList) {
         if (CollisionSystem.instance.checkForCollision(this, block)){
           this.x -= direction * amount;   //Undo the movement
           return;
         }
       }
     }
   
   
   
   resetPlayer() {
     camera.x = 0.0;
     camera.y = 0.0;
     Game.oxygen = 100.0;
     this.x = playerStartX;
     this.y = playerStartY;
     
     state = stateEnumAlive;
   }
  
   injureBuzz (double injuryAmount,bool boss) {
     Game.oxygen -= injuryAmount;
     SoundManager.instance.playSound(SoundManager.enumSoundInjure);
     state = stateEnumInjured;
     invincibilityTimer = 1.5;
     blink = true;
     gameLoop.addTimer((invincibilityTimer) => invincibilityCountDown(), 0.1);
     
     if(boss){
     hideBuzz();
     }
   }
   
   invincibilityCountDown() {
     if (invincibilityTimer > 0) {
       invincibilityTimer -= 0.10;
       blink = !blink;
       gameLoop.addTimer((invincibilityTimer) => invincibilityCountDown(), 0.10);
     } else {
       if (state != stateEnumDead) {
        state = stateEnumAlive;
        if(ATTACKED){
        unHideBuzz();
        }
       }
     }
   }
   
   hideBuzz(){
     ATTACKED = true;
     sprite.spritex = -500;
     originalX = this.x;
     
   }
   
   unHideBuzz(){
     ATTACKED = false;
     sprite.spritex = 0;
     this.x = originalX - 200.0;
   }
}