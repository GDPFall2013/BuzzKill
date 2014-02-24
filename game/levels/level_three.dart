part of gdp;

void setupLevelThree() {
 /* startMusic() {
        SoundManager.instance.setMusic(SoundManager.musicLevelOne);
        SoundManager.instance.startMusic();
      }
  
  SoundManager.instance.loadMusic(SoundManager.musicLevelOne,  startMusic);
  */
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
  
  om.addEnemy(new Spike()..initialize(800.0, 160.0)  //spike
        ..width = 100.0 .. height = 20.0);
  
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
  om.addEnemy(new Alien()..initialize(2600.0, 330.0));  //enemy
  
  om.addEnemy(new Spike()..initialize(2800.0, 340.0)  //spike
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
  om.addBlock(new Block()..initialize(3800.0, 600.0) // floor
                    ..width = 50.0 .. height = 340.0);
  
  
  // screen 4
  om.addBlock(new Block()..initialize(4200.0, 420.0)    // floor
                      ..width = 400.0 .. height = 140.0);
  om.addBlock(new Block()..initialize(4300.0, 300.0)    // Boulder
                  ..width = 120.0 .. height = 100.0);
  om.addEnemy(new Alien()..initialize(4200.0, 330.0));  //enemy
  om.addBlock(new Block()..initialize(4600.0, 300.0)    // floor
                  ..width = 200.0 .. height = 440.0);
  om.addBlock(new Block()..initialize(4730.0, 420.0)    // floor
                  ..width = 70.0 .. height = 140.0);
  om.addBlock(new Block()..initialize(4800.0, 350.0)    // floor
                  ..width = 70.0 .. height = 240.0);
  om.addBlock(new Block()..initialize(4930.0, 300.0)    // floor
                  ..width = 200.0 .. height = 440.0);
                  
  
  // screen 5
  om.addBlock(new Block()..initialize(5330.0, 420.0) // floor
                  ..width = 600.0 .. height = 140.0);
  om.addEnemy(new Spike()..initialize(5100.0, 340.0)  //spike
                  ..width = 100.0 .. height = 20.0);
  om.addBlock(new Block()..initialize(5800.0, 460.0) // floor
                  ..width = 50.0 .. height = 140.0);
  om.addBlock(new Block()..initialize(6190.0, 420.0) // floor  //spring
                  ..width = 600.0 .. height = 140.0);
  
  
  // screen 6
  om.addBlock(new Block()..initialize(7400.0, 420.0) // floor
                  ..width = 1000.0 .. height = 140.0);
  om.addBlock(new Block()..initialize(7400.0, 300.0)    // Boulder
                  ..width = 120.0 .. height = 100.0);
  
  
  // screen 7 / 8
  om.addBlock(new Block()..initialize(8000.0, 340.0) // floor
        ..width = 200.0 .. height = 260.0);
  om.addBlock(new Block()..initialize(8200.0, 420.0) // floor
                  ..width = 200.0 .. height = 140.0);
  
  om.addBlock(new Block()..initialize(8400.0, 500.0) // low level floor
        ..width = 600.0 .. height = 140.0);
  om.addBlock(new Block()..initialize(9100.0, 420.0) // floor
        ..width = 800.0 .. height = 140.0);
  om.addEnemy(new Alien()..initialize(9200.0, 330.0));  //enemy
  
  
  om.addBlock(new Block()..initialize(8400.0, 150.0) // high level floor
        ..width = 100.0 .. height = 101.0);
  om.addBlock(new Block()..initialize(8600.0, 50.0) // high level floor
        ..width = 100.0 .. height = 101.0);
  om.addBlock(new Block()..initialize(9100.0, -80.0) // high level floor
        ..width = 600.0 .. height = 101.0);
  
  
  // screen 9
  om.addBlock(new MovingBlock()..initializeMove(9600.0, 400.0, 10000.0, 400.0) // moving block
          ..width = 200.0 .. height = 101.0);
  om.addBlock(new Block()..initialize(10300.0, 420.0) // floor
        ..width = 400.0 .. height = 140.0);
  om.addBlock(new Block()..initialize(10750.0, 420.0) // floor
        ..width = 500.0 .. height = 140.0);
  om.addBlock(new Block()..initialize(10750.0, 300.0)    // Boulder
                  ..width = 120.0 .. height = 100.0);
  om.addBlock(new MovingBlock()..initializeMove(10950.0, 100.0, 11300.0, 100.0) // moving block
            ..width = 200.0 .. height = 101.0);
  om.addBlock(new Block()..initialize(11350.0, -120.0) // high floor
        ..width = 500.0 .. height = 140.0);
  
  
  // screen 10
  om.addBlock(new Block()..initialize(11250.0, 500.0) // low floor
        ..width = 500.0 .. height = 140.0);
  om.addEnemy(new Spike()..initialize(11400.0, 420.0)  //spike
                  ..width = 100.0 .. height = 20.0);
  om.addBlock(new Block()..initialize(11750.0, 420.0) // floor   //SPRING
        ..width = 500.0 .. height = 140.0);
  om.addBlock(new Block()..initialize(12550.0, 300.0) // floor
        ..width = 500.0 .. height = 350.0);
  
  
  
  // screen 11
  om.addBlock(new Block()..initialize(13050.0, 420.0) // floor
        ..width = 300.0 .. height = 350.0);
  om.addBlock(new Block()..initialize(13350.0, 460.0) // low floor
        ..width = 300.0 .. height = 350.0);
  om.addBlock(new Block()..initialize(13450.0, 235.0)    // Boulder
                  ..width = 120.0 .. height = 100.0);
  om.addBlock(new Block()..initialize(13700.0, 50.0) // high floor
        ..width = 100.0 .. height = 160.0);
  om.addBlock(new Block()..initialize(13950.0,80.0) // high floor
        ..width = 400.0 .. height = 101.0);
  om.addBlock(new Block()..initialize(14200.0, 50.0) // high floor
        ..width = 100.0 .. height = 160.0);
  
  
  // screen 12
  om.addBlock(new Block()..initialize(14500.0, 420.0) // floor
        ..width = 400.0 .. height = 140.0);
  om.addEnemy(new Alien()..initialize(14500.0, 330.0));  //enemy
  om.addBlock(new Block()..initialize(15000.0, 500.0) // low floor
        ..width = 800.0 .. height = 140.0);
  om.addBlock(new Block()..initialize(15050.0, 380.0)    // Boulder
        ..width = 120.0 .. height = 100.0);
  om.addBlock(new Block()..initialize(15300.0, 150.0) // high floor
        ..width = 100.0 .. height = 101.0);
  om.addBlock(new Block()..initialize(15600.0, 420.0) // floor
        ..width = 400.0 .. height = 140.0);
  om.addEnemy(new Spike()..initialize(15450.0, 340.0)  //spike
                  ..width = 100.0 .. height = 20.0);
  
  
  // screen 13
  om.addBlock(new Block()..initialize(16100.0, 420.0) // floor
        ..width = 600.0 .. height = 140.0);
  om.addBlock(new Block()..initialize(16300.0, 300.0)    // Boulder
        ..width = 120.0 .. height = 100.0);
  om.addBlock(new MovingBlock()..initializeMove(16500.0, 200.0, 16700.0, 200.0) // moving block
            ..width = 200.0 .. height = 101.0);
  om.addBlock(new MovingBlock()..initializeMove(16600.0, 400.0, 17100.0, 400.0) // moving block
            ..width = 200.0 .. height = 101.0);
}