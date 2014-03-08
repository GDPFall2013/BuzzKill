part of gdp;

class Droid extends Enemy{
  
  ImageElement img = new ImageElement();

  SpriteSheet sprite;
  int spriteXInitial = 0;
  int spriteYInitial = 582;
  int spriteWidth = 80;
  int spriteHeight = 115;
  
  double imgOffsetX = 8.0;
  double imgOffsetY = -7.0;

  double initialPos;
  double endPos;
  bool goingBack = false;
  
  double lastBullet = 250.0;
  Bullet bullet;
  double bulletDelay = 300.0;
  
  initialize(double x, double y) {
    super.initialize(x, y);
    width = 80.0;
    height = 115.0;
    sprite = new SpriteSheet("./content/enemies_spritesheet.png",
        spriteXInitial,spriteYInitial,spriteWidth,spriteHeight);
    
    initialPos = x;
    endPos = x-600.0;
    
    sprite.frameChangeRate = 10.0;
    sprite.numberOfFrames = 8;
    bullet = new Bullet()..initialize(this.x, this.y);
    ObjectManager.instance.addEnemy(bullet);
  }
  
  update (double dt) {
    lastBullet += dt;
   if (lastBullet > bulletDelay) {
     lastBullet -= bulletDelay;
     fire();
   }
    
    double speed = 0.4 * dt;
  
    //move aliens back and forth
    if (goingBack == false) {
      if(x >= endPos){
        x = x - speed;
      }
      else{
        goingBack = true;
        sprite.spritey = 720;
      }
    } else {
      if(x<initialPos){
        x = x + speed;
      }
      else{
        goingBack = false;
        sprite.spritey = 582;
      }
    }
    sprite.update(dt);  
  }
  
  draw(){
    sprite.drawOnPosition(x-width/2 - imgOffsetX, y-height/2 + imgOffsetY, width , height);
  }
  
   double injure() {
    return 10.0 * Globals.enemyDamage;
   }
   
   void fire() {
     SoundManager.instance.playSound(SoundManager.enumSoundShoot);
     int direction = 0;
     if (this.goingBack){
       direction = 1;
     } else {
       direction = -1;
     }
     bullet.initialize(this.x + 40 * direction, this.y + 30);
     bullet.setDirection(direction);
   }
}