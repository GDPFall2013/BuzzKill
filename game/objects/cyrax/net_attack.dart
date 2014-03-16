part of gdp;

class NetAttack extends CyraxAttack {
  
  int spriteXInitial = 0;
  int spriteYInitial = 720;  // 900 for other direction
  int spriteWidth = 100;
  int spriteHeight = 180;
  
  double imgOffsetX = 10.0;
  double imgOffsetY = -15.0;
  
  CyraxNet net = new CyraxNet();
  
  NetAttack() {
    sprite = new SpriteSheet("./content/Cyrax_attack_spritesheet.png",
        spriteXInitial,spriteYInitial,spriteWidth,spriteHeight); 
    sprite.frameChangeRate = 10000.0;
    sprite.numberOfFrames = 1;
    totalAttackTime = 1.5;
    net.initialize(-100000.0, 50.0);
    ObjectManager.instance.addEnemy(net);
  }
  
  void fire(double x, double y, int direction) {
   sprite.spritex = 0;
    
    if (direction == 1){
      sprite.spritey = 900;
    } else {
      sprite.spritey = 720;
    }
    gameLoop.addTimer((finish) => finishFire(x, y, direction), 0.5);
  }
  
  finishFire(double x, double y, int direction) {
    sprite.spritex = 100;
    SoundManager.instance.playSound(SoundManager.enumSoundCyraxNet);
    net.initialize(x, y - 20);
    net.setDirection(direction);
  }
  
  draw(x, y, width, height) {
    sprite.drawOnPosition(x-width/2 - imgOffsetX, y-height/2 + imgOffsetY, width , height);
  }
}