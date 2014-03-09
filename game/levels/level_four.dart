part of gdp;

void setupLevelFour() {
  startMusic() {
        SoundManager.instance.setMusic(SoundManager.musicLevelOne);
        SoundManager.instance.startMusic();
      }
  
  SoundManager.instance.loadMusic(SoundManager.musicLevelOne,  startMusic);
  
  ObjectManager om = ObjectManager.instance;
    
  om.addObject(Game.instance.player);
  
  
  
  //screen 1
  om.addBlock(new Block()..initialize(100.0, 420.0) // floor
      ..width = 300.0 .. height = 140.0);
  om.addBlock(new Block()..initialize(200.0, 300.0) // Boulder
        ..width = 120.0 .. height = 100.0);
  om.addBlock(new Block()..initialize(400.0, 100.0) // high floor
      ..width = 100.0 .. height = 101.0);
  om.addBlock(new MovingBlock()..initializeMove(400.0, 300.0, 800.0, 300.0) // moving block
      ..width = 200.0 .. height = 101.0..speedX = 3.0);
  om.addBlock(new Block()..initialize(1200.0, 300.0) // floor
      ..width = 600.0 .. height = 340.0);
  om.addEnemy(new Alien()..initialize(1400.0, 110.0));  //enemy
  /*om.addBlock(new Block()..initialize(800.0, 500.0) // low floor
      ..width = 600.0 .. height = 140.0);*/
  
  
  //screen 2 & screen 3
  om.addBlock(new MovingBlock()..initializeMove(1600.0, 500.0, 1790.0, 500.0) // moving block
      ..width = 100.0 .. height = 140.0..speedX = 3.0);
  om.addBlock(new Block()..initialize(2000.0, 420.0) // floor
      ..width = 200.0 .. height = 140.0);
  om.addBlock(new Block()..initialize(2400.0, 350.0) // high floor
      ..width = 300.0 .. height = 250.0);
  om.addEnemy(new Spike()..initialize(2450.0, 215.0)  //spike
        ..width = 100.0 .. height = 20.0);
  om.addBlock(new Block()..initialize(2600.0, 500.0) // low floor
      ..width = 200.0 .. height = 140.0);
  om.addBlock(new Block()..initialize(3700.0, 420.0) //  floor
      ..width = 2000.0 .. height = 110.0);
  
  
  om.addEnemy(new Spike()..initialize(3500.0, 355.0)  //spike
        ..width = 100.0 .. height = 20.0);
  om.addEnemy(new Spike()..initialize(3700.0, 355.0)  //spike
        ..width = 100.0 .. height = 20.0);
  om.addEnemy(new Spike()..initialize(3900.0, 355.0)  //spike
        ..width = 100.0 .. height = 20.0);
  om.addEnemy(new Spike()..initialize(4100.0, 355.0)  //spike
        ..width = 100.0 .. height = 20.0);
  om.addEnemy(new Spike()..initialize(4300.0, 355.0)  //spike
        ..width = 100.0 .. height = 20.0);
  om.addBlock(new Spring()..initialize(4650.0, 283.0));   //spring
  
  
  
  //screen 4
  om.addBlock(new Block()..initialize(5000.0, 530.0) // low floor
      ..width = 600.0 .. height = 140.0);
  om.addBlock(new Spring()..initialize(5250.0, 380.0));   //spring
  om.addBlock(new Block()..initialize(4950.0, -310.0) // high floor
      ..width = 300.0 .. height = 101.0);
  om.addBlock(new Block()..initialize(5600.0, 420.0) // floor
      ..width = 600.0 .. height = 140.0);
  om.addBlock(new Block()..initialize(6000.0, 500.0) // low floor
      ..width = 300.0 .. height = 140.0);
  om.addBlock(new Block()..initialize(6450.0, 420.0) // floor
      ..width = 600.0 .. height = 140.0);
  
  om.addBlock(new MovingBlock()..initializeMove(5600.0, 100.0, 6000.0, 100.0) // moving block
      ..width = 100.0 .. height = 101.0..speedX = 3.0);
  om.addBlock(new Block()..initialize(6100.0, 0.0) // high floor
      ..width = 200.0 .. height = 101.0);
  
  
  
  //screen 5
  //om.addBlock(new Block()..initialize(7000.0, 420.0) // high floor
  //    ..width = 100.0 .. height = 101.0);
  om.addBlock(new Spring()..initialize(7000.0, 400.0));   //spring
  om.addBlock(new Block()..initialize(7600.0, 420.0) // floor
      ..width = 400.0 .. height = 140.0);
  om.addEnemy(new Spike()..initialize(7600.0, 345.0)  //spike
        ..width = 100.0 .. height = 20.0);
  om.addBlock(new Block()..initialize(7900.0, 340.0) // high floor1
      ..width = 200.0 .. height = 360.0);
  om.addBlock(new Block()..initialize(8100.0, 280.0) // high floor2
      ..width = 200.0 .. height = 430.0);
  om.addBlock(new Block()..initialize(8300.0, 220.0) // high floor3
      ..width = 200.0 .. height = 500.0);
  om.addBlock(new Block()..initialize(8500.0, 160.0) // high floor4
      ..width = 200.0 .. height = 620.0);
  om.addBlock(new VerticalBlock()..initializeMove(8700.0, 0.0, 8700.0, 500.0) // vertical block
      ..width = 100.0 .. height = 101.0..speedY = 5.0);
  om.addBlock(new Block()..initialize(8900.0, 160.0) // high floor4
      ..width = 200.0 .. height = 620.0);
  
  
  //screen 6
  om.addBlock(new Block()..initialize(9100.0, 420.0) // floor
      ..width = 50.0 .. height = 140.0);
  om.addBlock(new Block()..initialize(9300.0, 420.0) // floor
      ..width = 50.0 .. height = 140.0);
  om.addBlock(new Block()..initialize(9500.0, 420.0) // floor
      ..width = 50.0 .. height = 140.0);
  om.addBlock(new Block()..initialize(9750.0, 420.0) // floor
      ..width = 50.0 .. height = 140.0);
  
  om.addBlock(new Block()..initialize(10350.0, 420.0) // floor
      ..width = 800.0 .. height = 140.0);
  om.addEnemy(new Alien()..initialize(10300.0, 330.0));  //enemy
  
  
  //screen 7
  om.addBlock(new Block()..initialize(11000.0, 420.0) // floor
      ..width = 50.0 .. height = 140.0);
  om.addBlock(new DiagonalBlock()..initializeMove(11350.0, -100.0, 11450.0, 400.0) // diagonal block
      ..width = 100.0 .. height = 101.0..speedY = 4.0);
  om.addBlock(new MovingBlock()..initializeMove(11400.0, 100.0, 11700.0, 100.0) // moving block
      ..width = 200.0 .. height = 101.0..speedX = 3.0);
  om.addBlock(new MovingBlock()..initializeMove(11600.0, 400.0, 12100.0, 400.0) // moving block
      ..width = 100.0 .. height = 101.0..speedX = 4.0);
  
  
  om.addBlock(new Block()..initialize(11900.0, 0.0) // high block
      ..width = 100.0 .. height = 101.0);
  om.addBlock(new Block()..initialize(12400.0, 380.0) // floor
      ..width = 300.0 .. height = 180.0);
  om.addEnemy(new Spike()..initialize(12500.0, 280.0)  //spike
        ..width = 100.0 .. height = 20.0);
  
  
  //screen 8
  om.addBlock(new Block()..initialize(13050.0, 500.0) // floor
      ..width = 1000.0 .. height = 140.0);
  Trigger trigger = new Trigger()..initialize(13100.0, 420.0)  //trigger
  ..width = 120.0 .. height = 20.0;
  Block floorObstacle = new Block()..initialize(13400.0, 80.0) // obstacle
   ..width = 200.0 .. height = 700.0 ..isObstacle = true;
   
   trigger.setTriggerObstacle(floorObstacle);
   om.addTrigger(trigger);
   om.addEnemy(new Spike()..initialize(13220.0, 420.0)    //spike
         ..width = 100.0 .. height = 20.0);
   om.addBlock(floorObstacle);
   
   om.addBlock(new Block()..initialize(13750.0, 420.0) // floor
       ..width = 500.0 .. height = 140.0);
   
}
