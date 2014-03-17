part of gdp;

class MiniShurikenAttack extends CyraxAttack {
  
  int spriteXInitial = 0;
  int spriteYInitial = 0; // 180 for other direction
  int spriteWidth = 100;
  int spriteHeight = 180;
  
  double imgOffsetX = 10.0;
  double imgOffsetY = -10.0;
  
  CyraxMiniShuriken s1 = new CyraxMiniShuriken();
  CyraxMiniShuriken s2 = new CyraxMiniShuriken();
  CyraxMiniShuriken s3 = new CyraxMiniShuriken();
  CyraxMiniShuriken s4 = new CyraxMiniShuriken();
  
  MiniShurikenAttack() {
    
    sprite = new SpriteSheet("./content/Cyrax_attack_spritesheet.png",
        spriteXInitial,spriteYInitial,spriteWidth,spriteHeight); 
    sprite.frameChangeRate = 10000.0;
    sprite.numberOfFrames = 1;
    totalAttackTime = 1.5;
    
    s1.initialize(-100000.0, 50.0);
    ObjectManager.instance.addEnemy(s1);
    s1.verticalVelocity = 1 * CyraxMiniShuriken.speed;
    s1.horizontalVelocity = -2 * CyraxMiniShuriken.speed;
    
    s2.initialize(-100000.0, 50.0);
    ObjectManager.instance.addEnemy(s2);
    s2.verticalVelocity = 2 * CyraxMiniShuriken.speed;
    s2.horizontalVelocity = -1 * CyraxMiniShuriken.speed;
    
    s3.initialize(-100000.0, 50.0);
    ObjectManager.instance.addEnemy(s3);
    s3.verticalVelocity = 2 * CyraxMiniShuriken.speed;
    s3.horizontalVelocity = 1 * CyraxMiniShuriken.speed;
    
    s4.initialize(-100000.0, 50.0);
    ObjectManager.instance.addEnemy(s4);
    s4.verticalVelocity = 1 * CyraxMiniShuriken.speed;
    s4.horizontalVelocity = 2 * CyraxMiniShuriken.speed;
  }
  
  void fire(double x, double y, int direction) {
     sprite.spritex = 0;

     if (direction == 1){
       sprite.spritey = 180;
     } else {
       sprite.spritey = 0;
     }
     gameLoop.addTimer((finish) => finishFire(x, y, direction), 0.5);
   }
  
  finishFire(double x, double y, int direction) {
    sprite.spritex = 100;
    SoundManager.instance.playSound(SoundManager.enumSoundCyraxMiniShuriken);
    s1.initialize(x, y - 20);
    s2.initialize(x, y - 20);
    s3.initialize(x, y - 20);
    s4.initialize(x, y - 20);
  }
  
  draw(x, y, width, height) {
    sprite.drawOnPosition(x-width/2 - imgOffsetX, y-height/2 + imgOffsetY, width , height);
  }
}