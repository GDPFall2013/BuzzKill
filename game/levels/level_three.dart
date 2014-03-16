part of gdp;

void setupLevelThree() {
  Game.instance.currentLevel = LevelManager.enumLevelThree;
  Globals.setBackground();
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
  om.addItem(new Oxygen()..initialize(350.0, 270.0));
  om.addItem(new Oxygen()..initialize(400.0, 270.0));
  om.addItem(new Oxygen()..initialize(450.0, 270.0));
  
  om.addBlock(new Block()..initialize(600.0, 320.0) // floor
          ..width = 200.0 .. height = 140.0);
  om.addItem(new Oxygen()..initialize(550.0, 210.0));
  om.addItem(new Oxygen()..initialize(600.0, 210.0));
  om.addItem(new Oxygen()..initialize(650.0, 210.0));
  
  om.addBlock(new Block()..initialize(800.0, 260.0) // floor
            ..width = 200.0 .. height = 180.0);
  om.addItem(new Oxygen()..initialize(775.0, 0.0));
  om.addItem(new Oxygen()..initialize(800.0, 0.0));

  om.addEnemy(new Spike()..initialize(800.0, 160.0)  //spike
        ..width = 100.0 .. height = 20.0);
  
  om.addBlock(new Block()..initialize(1000.0, 320.0) // floor
            ..width = 200.0 .. height = 140.0);
  om.addItem(new Oxygen()..initialize(950.0, 210.0));
  om.addItem(new Oxygen()..initialize(1000.0, 210.0));
  om.addItem(new Oxygen()..initialize(1050.0, 210.0));
  
  om.addBlock(new Block()..initialize(1200.0, 380.0) // floor
          ..width = 200.0 .. height = 140.0);
  
  
  // screen 2
  om.addBlock(new Block()..initialize(1600.0, 300.0) // Boulder
        ..width = 120.0 .. height = 100.0);
  
  om.addBlock(new Block()..initialize(2000.0, 500.0) // low level floor
        ..width = 600.0 .. height = 140.0);
  om.addItem(new Oxygen()..initialize(1900.0, 390.0));
  om.addItem(new Oxygen()..initialize(1950.0, 390.0));
  om.addItem(new Oxygen()..initialize(2000.0, 390.0));
  om.addItem(new Oxygen()..initialize(2050.0, 390.0));
  om.addItem(new Oxygen()..initialize(2100.0, 390.0));
  om.addItem(new Oxygen()..initialize(2150.0, 390.0));
  
  om.addBlock(new Block()..initialize(2600.0, 420.0) // floor
          ..width = 600.0 .. height = 140.0);
  om.addEnemy(new Alien()..initialize(2600.0, 330.0));  //enemy
  
  om.addEnemy(new Spike()..initialize(2800.0, 340.0)  //spike
        ..width = 100.0 .. height = 20.0);
  
  
 
  // screen 3
  om.addBlock(new Block()..initialize(3100.0, 350.0) // floor
            ..width = 100.0 .. height = 340.0);
  om.addBlock(new Block()..initialize(3300.0, 300.0) // floor
              ..width = 100.0 .. height = 340.0);
  om.addBlock(new Block()..initialize(3500.0, 200.0) // floor
                ..width = 100.0 .. height = 550.0);
  om.addBlock(new Block()..initialize(3700.0, 100.0) // floor
                  ..width = 100.0 .. height = 800.0);
  
  om.addItem(new Oxygen()..initialize(3800.0, -280.0));
  om.addItem(new Oxygen()..initialize(3800.0, -230.0));
  om.addItem(new Oxygen()..initialize(3800.0, -180.0));
  om.addItem(new Oxygen()..initialize(3800.0, -130.0));
  om.addItem(new Oxygen()..initialize(3800.0, -80.0));
  om.addItem(new Oxygen()..initialize(3800.0, -30.0));
  om.addItem(new Oxygen()..initialize(3800.0, 20.0));
  om.addItem(new Oxygen()..initialize(3800.0, 70.0));
  om.addItem(new Oxygen()..initialize(3800.0, 120.0));
  om.addItem(new Oxygen()..initialize(3800.0, 170.0));
  om.addItem(new Oxygen()..initialize(3800.0, 220.0));
  om.addItem(new Oxygen()..initialize(3800.0, 270.0));
  om.addItem(new Oxygen()..initialize(3800.0, 320.0));
  om.addItem(new Oxygen()..initialize(3800.0, 370.0));
  
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
  om.addItem(new Oxygen()..initialize(4730.0, 120.0));
  om.addItem(new Oxygen()..initialize(4730.0, 170.0));
  om.addItem(new Oxygen()..initialize(4730.0, 220.0));
  om.addItem(new Oxygen()..initialize(4730.0, 270.0));
  om.addItem(new Oxygen()..initialize(4730.0, 320.0));
  
  om.addBlock(new Block()..initialize(4800.0, 350.0)    // floor
                  ..width = 70.0 .. height = 240.0);
  om.addItem(new Oxygen()..initialize(4800.0, 120.0));
  om.addItem(new Oxygen()..initialize(4800.0, 170.0));
  om.addItem(new Oxygen()..initialize(4800.0, 220.0));

  om.addBlock(new Block()..initialize(4930.0, 300.0)    // floor
                  ..width = 200.0 .. height = 440.0);
                  
  
  // screen 5
  om.addBlock(new Block()..initialize(5330.0, 420.0) // floor
                  ..width = 600.0 .. height = 140.0);
  om.addEnemy(new Spike()..initialize(5100.0, 340.0)  //spike
                  ..width = 100.0 .. height = 20.0);

  om.addEnemy(new Spike()..initialize(5300.0, 340.0)  //spike
                  ..width = 100.0 .. height = 20.0);
  om.addItem(new Oxygen()..initialize(5550.0, 300.0));
  om.addItem(new Oxygen()..initialize(5600.0, 250.0));
  om.addItem(new Oxygen()..initialize(5650.0, 200.0));
  om.addItem(new Oxygen()..initialize(5700.0, 150.0));
  om.addItem(new Oxygen()..initialize(5750.0, 200.0));
  om.addItem(new Oxygen()..initialize(5800.0, 250.0));
  om.addItem(new Oxygen()..initialize(5800.0, 300.0));
  om.addItem(new Oxygen()..initialize(5800.0, 350.0));
  om.addBlock(new Block()..initialize(5800.0, 460.0)   // floor
                  ..width = 50.0 .. height = 140.0);
  
  om.addBlock(new Block()..initialize(6190.0, 420.0) // floor
                  ..width = 600.0 .. height = 140.0);
  om.addEnemy(new Droid()..initialize(6200.0, 310.0));  //enemy
  om.addBlock(new Spring()..initialize(6400.0, 270.0));   //spring
  
  // screen 6
  om.addBlock(new Block()..initialize(7400.0, 420.0) // floor
                  ..width = 1000.0 .. height = 140.0);
  om.addBlock(new Block()..initialize(7400.0, 300.0)    // Boulder
                  ..width = 120.0 .. height = 100.0);
  om.addEnemy(new Spike()..initialize(7500.0, 340.0)  //spike
                  ..width = 100.0 .. height = 20.0);
  om.addEnemy(new Spike()..initialize(7550.0, 340.0)  //spike
                  ..width = 100.0 .. height = 20.0);
  
  // screen 7 / 8
  om.addBlock(new Block()..initialize(8000.0, 340.0) // floor
        ..width = 200.0 .. height = 260.0);
  om.addBlock(new Block()..initialize(8200.0, 420.0) // floor
                  ..width = 200.0 .. height = 140.0);
  
  
  om.addBlock(new Spring()..initialize(8200.0, 270.0));   //spring
  
  om.addBlock(new Block()..initialize(8400.0, 500.0) // low level floor
        ..width = 600.0 .. height = 140.0);
  om.addItem(new Oxygen()..initialize(8350.0, 390.0));
  om.addItem(new Oxygen()..initialize(8400.0, 390.0));
  om.addItem(new Oxygen()..initialize(8450.0, 390.0));
  om.addItem(new Oxygen()..initialize(8500.0, 390.0));
  om.addItem(new Oxygen()..initialize(8550.0, 390.0));
  om.addItem(new Oxygen()..initialize(8600.0, 390.0));
  om.addItem(new Oxygen()..initialize(8650.0, 390.0));

  
  
  om.addBlock(new Block()..initialize(9100.0, 420.0) // floor
        ..width = 800.0 .. height = 140.0);
  om.addBlock(new Block()..initialize(8800.0, 300.0)    // Boulder
                  ..width = 120.0 .. height = 100.0);
  om.addEnemy(new Alien()..initialize(9200.0, 330.0)
      ..JUMP=true);                                     //enemy
  om.addEnemy(new Alien()..initialize(9450.0, 330.0)
      ..JUMP=false);                                     //enemy
 // om.addBlock(new MovingBlock()..initializeMove(8900.0, 150.0, 9400.0, 150.0) // moving block
 //         ..width = 200.0 .. height = 101.0..speed = 3.0);
  
  
  
 // om.addBlock(new Block()..initialize(8330.0, 150.0) // high level floor
 //       ..width = 200.0 .. height = 101.0);
 // om.addBlock(new Spring()..initialize(8330.0, 0.0));   //spring
  //om.addBlock(new Block()..initialize(8600.0, 50.0) // high level floor
  //      ..width = 100.0 .. height = 101.0);
  om.addBlock(new Block()..initialize(9000.0, -80.0) // high level floor
        ..width = 600.0 .. height = 101.0);
  om.addItem(new Oxygen()..initialize(8700.0, -160.0));
  //om.addItem(new Oxygen()..initialize(8700.0, -210.0));
  om.addItem(new Oxygen()..initialize(8750.0, -160.0));
  //om.addItem(new Oxygen()..initialize(8750.0, -210.0));
  om.addItem(new Oxygen()..initialize(8800.0, -160.0));
  //om.addItem(new Oxygen()..initialize(8800.0, -210.0));
  om.addItem(new Oxygen()..initialize(8850.0, -160.0));
  //om.addItem(new Oxygen()..initialize(8850.0, -210.0));
  om.addItem(new Oxygen()..initialize(8900.0, -160.0));
  //om.addItem(new Oxygen()..initialize(8900.0, -210.0));
  om.addItem(new Oxygen()..initialize(8950.0, -160.0));
  //om.addItem(new Oxygen()..initialize(8950.0, -210.0));
  om.addItem(new Oxygen()..initialize(9000.0, -160.0));
  //om.addItem(new Oxygen()..initialize(9000.0, -210.0));
  om.addItem(new Oxygen()..initialize(9050.0, -160.0));
  //om.addItem(new Oxygen()..initialize(9050.0, -210.0));
  om.addItem(new Oxygen()..initialize(9100.0, -160.0));
  //om.addItem(new Oxygen()..initialize(9100.0, -210.0));
  om.addItem(new Oxygen()..initialize(9150.0, -160.0));
  //om.addItem(new Oxygen()..initialize(9150.0, -210.0));
  om.addItem(new Oxygen()..initialize(9200.0, -160.0));
  //om.addItem(new Oxygen()..initialize(9200.0, -210.0));
  om.addItem(new Oxygen()..initialize(9250.0, -160.0));
  //om.addItem(new Oxygen()..initialize(9250.0, -210.0));
  om.addItem(new Oxygen()..initialize(9300.0, -160.0));
  //om.addItem(new Oxygen()..initialize(9300.0, -210.0));
 // om.addItem(new Oxygen()..initialize(9350.0, -160.0));
 // om.addItem(new Oxygen()..initialize(9350.0, -210.0));
 
/*
  om.addItem(new Oxygen()..initialize(8900.0, 290.0));
  om.addItem(new Oxygen()..initialize(8950.0, 290.0));
  om.addItem(new Oxygen()..initialize(9000.0, 290.0));
  om.addItem(new Oxygen()..initialize(9050.0, 290.0));
  om.addItem(new Oxygen()..initialize(9100.0, 290.0));
  om.addItem(new Oxygen()..initialize(9150.0, 290.0));
  om.addItem(new Oxygen()..initialize(9200.0, 290.0));
  om.addItem(new Oxygen()..initialize(9250.0, 290.0));
*/
  
  
  // screen 9
  om.addBlock(new MovingBlock()..initializeMove(9600.0, 400.0, 10000.0, 400.0) // moving block
          ..width = 200.0 .. height = 101.0..speedX = 3.0);
  om.addItem(new Oxygen()..initialize(9800.0, 290.0));
  om.addItem(new Oxygen()..initialize(9850.0, 290.0));
  om.addItem(new Oxygen()..initialize(9900.0, 290.0));
  om.addItem(new Oxygen()..initialize(9950.0, 290.0));
  om.addItem(new Oxygen()..initialize(10000.0, 290.0));
  
  
  om.addBlock(new Block()..initialize(10300.0, 420.0) // floor
        ..width = 400.0 .. height = 140.0);
  om.addBlock(new Spring()..initialize(10200.0, 270.0));   //spring
  om.addEnemy(new Gorilla()..initialize(10500.0, 300.0));  //enemy gorilla
  om.addBlock(new Block()..initialize(10750.0, 420.0) // floor
        ..width = 500.0 .. height = 140.0);
  om.addBlock(new Block()..initialize(10750.0, 300.0)    // Boulder
                  ..width = 120.0 .. height = 100.0);
  om.addBlock(new MovingBlock()..initializeMove(10950.0, 100.0, 11350.0, 100.0) // moving block
            ..width = 200.0 .. height = 101.0..speedX = 3.0);
  
  om.addItem(new Oxygen()..initialize(10950.0, 0.0));
  om.addItem(new Oxygen()..initialize(11000.0, 0.0));
  om.addItem(new Oxygen()..initialize(11050.0, 0.0));
  om.addItem(new Oxygen()..initialize(11100.0, 0.0));
  om.addItem(new Oxygen()..initialize(11150.0, 0.0));
  om.addItem(new Oxygen()..initialize(11200.0, 0.0));
  om.addItem(new Oxygen()..initialize(11250.0, 0.0));
  om.addItem(new Oxygen()..initialize(11300.0, 0.0));
  om.addItem(new Oxygen()..initialize(11350.0, 0.0));
  om.addItem(new Oxygen()..initialize(11400.0, 0.0));
  om.addItem(new Oxygen()..initialize(11450.0, 0.0));
  
  //om.addItem(new Oxygen()..initialize(11500.0, 0.0));
  
  om.addBlock(new Block()..initialize(11350.0, -120.0) // high floor
        ..width = 500.0 .. height = 140.0);
  
  
  // screen 10
  om.addBlock(new Block()..initialize(11250.0, 500.0) // low floor
        ..width = 500.0 .. height = 140.0);
  om.addEnemy(new Alien()..initialize(11250.0, 410.0));  //enemy
  om.addEnemy(new Spike()..initialize(11400.0, 420.0)  //spike
                  ..width = 100.0 .. height = 20.0);
  om.addBlock(new Block()..initialize(11750.0, 420.0) // floor   //SPRING
        ..width = 500.0 .. height = 140.0);
  om.addBlock(new Spring()..initialize(11900.0, 270.0));   //spring
  om.addItem(new Oxygen()..initialize(11900.0, -400.0));
  om.addItem(new Oxygen()..initialize(11900.0, -350.0));
  om.addItem(new Oxygen()..initialize(11900.0, -300.0));
  om.addItem(new Oxygen()..initialize(11900.0, -250.0));
  om.addItem(new Oxygen()..initialize(11900.0, -200.0));
  om.addItem(new Oxygen()..initialize(11900.0, -150.0));
  om.addItem(new Oxygen()..initialize(11900.0, -100.0));
  om.addItem(new Oxygen()..initialize(11900.0, -50.0));
  om.addItem(new Oxygen()..initialize(11900.0, 0.0));
  
  om.addBlock(new Block()..initialize(12550.0, 300.0) // floor
        ..width = 500.0 .. height = 350.0);
  om.addEnemy(new Droid()..initialize(12800.0, 80.0)  //enemy
      ..JUMP=true);                                     
  
  
  // screen 11
  om.addBlock(new Block()..initialize(13000.0, -250.0) // high floor
        ..width = 100.0 .. height = 160.0);
  om.addBlock(new Block()..initialize(13250.0,-220.0) // high floor
        ..width = 400.0 .. height = 101.0);
  om.addBlock(new Spring()..initialize(13000.0, -400.0));   //spring
  om.addBlock(new Block()..initialize(13500.0, -250.0) // high floor
        ..width = 100.0 .. height = 160.0);
  //om.addItem(new Oxygen()..initialize(13000.0, -360.0));
  om.addItem(new Oxygen()..initialize(13050.0, -360.0));
  om.addItem(new Oxygen()..initialize(13100.0, -310.0));
  om.addItem(new Oxygen()..initialize(13150.0, -310.0));
  om.addItem(new Oxygen()..initialize(13200.0, -310.0));
  om.addItem(new Oxygen()..initialize(13250.0, -310.0));
  om.addItem(new Oxygen()..initialize(13300.0, -310.0));
  om.addItem(new Oxygen()..initialize(13350.0, -310.0));
  om.addItem(new Oxygen()..initialize(13400.0, -310.0));
  
  om.addItem(new Oxygen()..initialize(13100.0, -360.0));
  om.addItem(new Oxygen()..initialize(13150.0, -360.0));
  om.addItem(new Oxygen()..initialize(13200.0, -360.0));
  om.addItem(new Oxygen()..initialize(13250.0, -360.0));
  om.addItem(new Oxygen()..initialize(13300.0, -360.0));
  om.addItem(new Oxygen()..initialize(13350.0, -360.0));
  om.addItem(new Oxygen()..initialize(13400.0, -360.0));
  om.addItem(new Oxygen()..initialize(13450.0, -360.0));
  om.addItem(new Oxygen()..initialize(13500.0, -360.0));
  
  
  om.addBlock(new Block()..initialize(13050.0, 420.0) // floor
        ..width = 300.0 .. height = 350.0);
  om.addBlock(new Block()..initialize(13350.0, 460.0) // low floor
        ..width = 300.0 .. height = 350.0);
  om.addBlock(new Block()..initialize(13450.0, 235.0)    // Boulder
                  ..width = 120.0 .. height = 100.0);
  
  
  om.addBlock(new Block()..initialize(13650.0, 480.0) // high floor
        ..width = 100.0 .. height = 101.0);
  om.addItem(new Oxygen()..initialize(13650.0, 400.0));
  
  om.addBlock(new Block()..initialize(13850.0, 420.0) // high floor
        ..width = 100.0 .. height = 101.0);
  om.addItem(new Oxygen()..initialize(13850.0, 340.0));
  
  om.addBlock(new Block()..initialize(14050.0, 250.0) // high floor
        ..width = 100.0 .. height = 101.0);
  om.addItem(new Oxygen()..initialize(14050.0, 170.0));
  
  om.addBlock(new Block()..initialize(13850.0, 30.0) // high floor
        ..width = 100.0 .. height = 101.0);
  om.addItem(new Oxygen()..initialize(13850.0, -50.0));
  
  om.addBlock(new Block()..initialize(13650.0, -130.0) // high floor
        ..width = 100.0 .. height = 101.0);
  om.addItem(new Oxygen()..initialize(13650.0, -210.0));
  
  om.addBlock(new Block()..initialize(14050.0, -180.0) // high floor
        ..width = 100.0 .. height = 101.0);
  om.addItem(new Oxygen()..initialize(14050.0, -260.0));
 // om.addBlock(new Block()..initialize(14050.0, 480.0) // high floor
   //     ..width = 100.0 .. height = 101.0);
  
/*
  om.addBlock(new Block()..initialize(13700.0, 50.0) // high floor
        ..width = 100.0 .. height = 160.0);
  om.addBlock(new Block()..initialize(13950.0,80.0) // high floor
        ..width = 400.0 .. height = 101.0);
  om.addBlock(new Block()..initialize(14200.0, 50.0) // high floor
        ..width = 100.0 .. height = 160.0);
        */
  
  // screen 12
  om.addBlock(new Block()..initialize(14500.0, -200.0) // high floor
        ..width = 500.0 .. height = 101.0);
  //om.addBlock(new Block()..initialize(15000.0, -100.0) // high floor
    //    ..width = 100.0 .. height = 101.0);
  om.addBlock(new Block()..initialize(14500.0, 420.0) // floor
        ..width = 400.0 .. height = 140.0);
  om.addEnemy(new Alien()..initialize(14500.0, 330.0));  //enemy
  om.addBlock(new Block()..initialize(15000.0, 500.0) // low floor
        ..width = 800.0 .. height = 140.0);
 // om.addBlock(new MovingBlock()..initializeMove(15000.0, 100.0, 16000.0, 100.0) // moving block
 //             ..width = 200.0 .. height = 101.0..speed = 10.0);
  //om.addBlock(new MovingBlock()..initializeMove(14900.0, -100.0, 16000.0, -100.0) // moving block
  //              ..width = 100.0 .. height = 101.0..speed = 10.0);
  om.addItem(new Oxygen()..initialize(14750.0, 390.0));
  om.addItem(new Oxygen()..initialize(14800.0, 390.0));
  om.addItem(new Oxygen()..initialize(14850.0, 390.0));
  om.addItem(new Oxygen()..initialize(14900.0, 390.0));
  om.addItem(new Oxygen()..initialize(14950.0, 390.0));

  
  om.addBlock(new Block()..initialize(15050.0, 380.0)    // Boulder
        ..width = 120.0 .. height = 100.0);
  om.addItem(new Oxygen()..initialize(15150.0, 390.0));
  om.addItem(new Oxygen()..initialize(15200.0, 390.0));
  om.addItem(new Oxygen()..initialize(15250.0, 390.0));
  om.addItem(new Oxygen()..initialize(15300.0, 390.0));
  om.addItem(new Oxygen()..initialize(15350.0, 390.0));
  
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
  om.addBlock(new MovingBlock()..initializeMove(16500.0, 200.0, 16800.0, 200.0) // moving block
            ..width = 200.0 .. height = 101.0..speedX = 3.0);
  om.addItem(new Oxygen()..initialize(16500.0, 100.0));
  om.addItem(new Oxygen()..initialize(16550.0, 100.0));
  om.addItem(new Oxygen()..initialize(16600.0, 100.0));
  om.addItem(new Oxygen()..initialize(16650.0, 100.0));
  om.addItem(new Oxygen()..initialize(16700.0, 100.0));
  om.addItem(new Oxygen()..initialize(16750.0, 100.0));
  om.addItem(new Oxygen()..initialize(16800.0, 100.0));
  
  om.addBlock(new MovingBlock()..initializeMove(16800.0, 400.0, 17200.0, 400.0) // moving block
            ..width = 200.0 .. height = 101.0..speedX = 4.0);
  om.addItem(new Oxygen()..initialize(16900.0, 300.0));
  om.addItem(new Oxygen()..initialize(16950.0, 300.0));
  om.addItem(new Oxygen()..initialize(17000.0, 300.0));
  om.addItem(new Oxygen()..initialize(17050.0, 300.0));
  om.addItem(new Oxygen()..initialize(17100.0, 300.0));
  om.addItem(new Oxygen()..initialize(17150.0, 300.0));
  om.addItem(new Oxygen()..initialize(17200.0, 300.0));
  
  
  om.addBlock(new Block()..initialize(17600.0, 420.0) // floor
        ..width = 600.0 .. height = 140.0);
  om.addEnemy(new Droid()..initialize(17900.0, 310.0));  //enemy
  
  
  // screen 14
  MovingBlock mBlock = new MovingBlock()..initializeMove(18100.0, 400.0, 18500.0, 400.0) // moving block
  ..width = 400.0 .. height = 101.0..speedX = 3.0;
  
  //om.addBlock(new MovingBlock()..initializeMove(18100.0, 400.0, 18500.0, 400.0) // moving block
    //        ..width = 400.0 .. height = 101.0..speed = 2.0);
  om.addBlock(mBlock);
  om.addBlock(new Spring()..initialize(18200.0, 270.0)
      ..movingBlock = mBlock);                                 //spring
  
  om.addBlock(new Block()..initialize(18600.0, -50.0) // trigger floor
        ..width = 200.0 .. height = 101.0);
  
  Trigger trigger = new Trigger()..initialize(18600.0, -110.0)  //trigger
  ..width = 120.0 .. height = 20.0;
  Block floorObstacle = new Block()..initialize(18800.0, 0.0) // obstacle
   ..width = 200.0 .. height = 1000.0 ..isObstacle = true;
   om.addBlock(floorObstacle);
   
   trigger.setTriggerObstacle(floorObstacle);
   om.addTrigger(trigger);
   
   
  // screen 15
  om.addBlock(new Block()..initialize(19900.0, 451.5) // floor
         ..width = 2000.0 .. height = 140.0);
  //om.addItem(new Oxygen()..initialize(18900.0, 350.0));
  
  
  
  //om.addItem(new Oxygen()..initialize(18950.0, 350.0));
  //om.addItem(new Oxygen()..initialize(19000.0, 350.0));
  om.addItem(new Oxygen()..initialize(19050.0, 350.0));
  om.addItem(new Oxygen()..initialize(19100.0, 350.0));
  om.addItem(new Oxygen()..initialize(19150.0, 350.0));
  om.addItem(new Oxygen()..initialize(19200.0, 350.0));
  om.addItem(new Oxygen()..initialize(19250.0, 350.0));
  om.addItem(new Oxygen()..initialize(19300.0, 350.0));
  om.addItem(new Oxygen()..initialize(19350.0, 350.0));
  om.addItem(new Oxygen()..initialize(19400.0, 350.0));
  om.addItem(new Oxygen()..initialize(19450.0, 350.0));
  om.addItem(new Oxygen()..initialize(19500.0, 350.0));
  om.addItem(new Oxygen()..initialize(19550.0, 350.0));
  om.addItem(new Oxygen()..initialize(19600.0, 350.0));
  om.addItem(new Oxygen()..initialize(19650.0, 350.0));
  om.addItem(new Oxygen()..initialize(19700.0, 350.0));
  om.addItem(new Oxygen()..initialize(19750.0, 350.0));
  
  
 // om.addEnemy(new Cyrax()..initialize(20000.0, 310.0));  //enemy
  
  om.addBlock(new Spring()..initialize(20850.0, 300.0));   //spring
  
  //om.addBlock(new MovingBlock()..initializeMove(19600.0, 200.0, 20000.0, 200.0) // moving block
  //          ..width = 200.0 .. height = 101.0..speed = 3.0);
  
  om.addBlock(new Block()..initialize(21300.0, -200.0) // floor
         ..width = 200.0 .. height = 101.0);
  om.addItem(new ShipItem()..initialize(21300.0, -320.0)
        ..level = 3);
}