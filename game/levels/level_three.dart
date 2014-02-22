part of gdp;

void setupLevelThree() {
  startMusic() {
        SoundManager.instance.setMusic(SoundManager.musicLevelOne);
        SoundManager.instance.startMusic();
      }
  
  SoundManager.instance.loadMusic(SoundManager.musicLevelOne,  startMusic);
  
  ObjectManager om = ObjectManager.instance;
    
  om.addObject(Game.instance.player);
  
  
  // screen 1
  om.addBlock(new Block()..initialize(800.0, 420.0) // floor
      ..width = 2000.0 .. height = 140.0);
  om.addBlock(new Block()..initialize(400.0, 380.0) // floor
        ..width = 200.0 .. height = 140.0);
  om.addBlock(new Block()..initialize(600.0, 320.0) // floor
          ..width = 200.0 .. height = 140.0);
  om.addBlock(new Block()..initialize(800.0, 260.0) // floor
            ..width = 200.0 .. height = 180.0);
  
  om.addBlock(new Block()..initialize(1000.0, 320.0) // floor
            ..width = 200.0 .. height = 140.0);
  om.addBlock(new Block()..initialize(1200.0, 380.0) // floor
          ..width = 200.0 .. height = 140.0);
  
  
  // screen 2
  om.addBlock(new Block()..initialize(1600.0, 300.0) // Boulder
        ..width = 120.0 .. height = 100.0);
  
  om.addBlock(new Block()..initialize(2000.0, 500.0) // low level floor
        ..width = 600.0 .. height = 140.0);
  
  om.addBlock(new Block()..initialize(2600.0, 420.0) // floor
          ..width = 600.0 .. height = 140.0);
  om.addEnemy(new Alien()..initialize(2600.0, 330.0));
  
  om.addEnemy(new Spike()..initialize(2800.0, 340.0)
        ..width = 100.0 .. height = 20.0);
  
  
 
  // screen 3
  om.addBlock(new Block()..initialize(3100.0, 300.0) // floor
            ..width = 100.0 .. height = 340.0);
  om.addBlock(new Block()..initialize(3300.0, 300.0) // floor
              ..width = 100.0 .. height = 340.0);
  om.addBlock(new Block()..initialize(3500.0, 200.0) // floor
                ..width = 100.0 .. height = 550.0);
  om.addBlock(new Block()..initialize(3700.0, 100.0) // floor
                  ..width = 100.0 .. height = 800.0);
  om.addBlock(new Block()..initialize(3900.0, 600.0) // floor
                    ..width = 100.0 .. height = 340.0);
  
  
  // screen 4
  om.addBlock(new Block()..initialize(4300.0, 420.0) // floor
                      ..width = 1000.0 .. height = 140.0);
  om.addBlock(new Block()..initialize(4500.0, 300.0) // Boulder
          ..width = 120.0 .. height = 100.0);
                  
}