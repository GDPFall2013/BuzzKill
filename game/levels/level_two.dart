part of gdp;

void setupLevelTwo() {
  Game.instance.currentLevel = LevelManager.enumLevelTwo;
  Globals.setBackground();
  startMusic() {
      SoundManager.instance.setMusic(SoundManager.musicLevelOne);
      SoundManager.instance.startMusic();
    }
    
  SoundManager.instance.loadMusic(SoundManager.musicLevelOne,  startMusic);
  
  ObjectManager om = ObjectManager.instance;
  
  om.addObject(Game.instance.player);

  
  // screen 1
  om.addBlock(new Block()..initialize(200.0, 420.0) // floor
      ..width = 750.0 .. height = 140.0);
  
  om.addEnemy(new Spike()..initialize(200.0, 340.0)
      ..width = 100.0 .. height = 20.0);
  
  om.addBlock(new Block()..initialize(400.0, 300.0) // Boulder
      ..width = 120.0 .. height = 100.0);
  om.addBlock(new Block()..initialize(520.0, 300.0) // Boulder
      ..width = 120.0 .. height = 100.0);
  
  om.addItem(new Oxygen()..initialize(400.0, 180.0));
  om.addItem(new Oxygen()..initialize(450.0, 180.0));
  om.addItem(new Oxygen()..initialize(500.0, 180.0));

  
 // om.addBlock(new Block()..initialize(330.0, 300.0) // Boulder
   //   ..width = 120.0 .. height = 100.0);
  
 
  
  
  // screen 1.5
  om.addBlock(new Block()..initialize(800.0, 300.0) // floor
      ..width = 150.0 .. height = 400.0);
  om.addItem(new Oxygen()..initialize(800.0, 20.0));
  om.addItem(new Oxygen()..initialize(850.0, 20.0));
  om.addItem(new Oxygen()..initialize(900.0, 20.0));

  
  
  // screen 2
  om.addBlock(new Block()..initialize(1500.0, 420.0) // floor
      ..width = 1000.0 .. height = 140.0);
  //om.addEnemy(new Alien()..initialize(1200.0, 330.0));
  om.addBlock(new Block()..initialize(1300.0, 300.0) // Boulder
      ..width = 120.0 .. height = 100.0);

  
  // screen 2.5
  om.addItem(new Oxygen()..initialize(1100.0, 290.0));
  om.addItem(new Oxygen()..initialize(1150.0, 290.0));
  om.addItem(new Oxygen()..initialize(1200.0, 290.0));
  //om.addEnemy(new Bullet()..initialize(2000.0, 330.0));
  om.addEnemy(new Droid()..initialize(2000.0, 305.0));
  //om.addEnemy(new Spike()..initialize(1900.0, 340.0)
  //    ..width = 100.0 .. height = 20.0);
  
  
  // screen 3
  om.addBlock(new Block()..initialize(2350.0, 480.0) // floor
      ..width = 350.0 .. height = 140.0);
  
  om.addItem(new Oxygen()..initialize(2200.0, 350.0));
  om.addItem(new Oxygen()..initialize(2250.0, 350.0));
  om.addItem(new Oxygen()..initialize(2300.0, 350.0));
  om.addItem(new Oxygen()..initialize(2350.0, 350.0));
  om.addItem(new Oxygen()..initialize(2400.0, 350.0));

  
  // screen 3.5
  om.addBlock(new Block()..initialize(2950.0, 420.0) // floor
      ..width = 550.0 .. height = 140.0);
  om.addItem(new Oxygen()..initialize(2800.0, 290.0));
  om.addItem(new Oxygen()..initialize(2850.0, 290.0));
  om.addItem(new Oxygen()..initialize(2900.0, 290.0));
  
  om.addEnemy(new Alien()..initialize(3000.0, 330.0));
  
  
  // screen 4
  om.addBlock(new Block()..initialize(3350.0, 420.0) // floor
      ..width = 150.0 .. height = 140.0);
  om.addBlock(new Block()..initialize(3550.0, 420.0) // floor
      ..width = 150.0 .. height = 140.0);
  om.addBlock(new Block()..initialize(3750.0, 420.0) // floor
      ..width = 150.0 .. height = 140.0);
  om.addItem(new Oxygen()..initialize(3350.0, 290.0));
  om.addItem(new Oxygen()..initialize(3550.0, 290.0));
  om.addItem(new Oxygen()..initialize(3750.0, 290.0));
  
  
  
  // screen 5
  om.addBlock(new Block()..initialize(4300.0, 420.0) // floor
      ..width = 650.0 .. height = 140.0);
  om.addEnemy(new Spike()..initialize(4250.0, 340.0)
      ..width = 100.0 .. height = 20.0);
  om.addItem(new Oxygen()..initialize(4175.0, 150.0));
  om.addItem(new Oxygen()..initialize(4210.0, 150.0));
  om.addBlock(new Block()..initialize(4530.0, 300.0) // Boulder
      ..width = 120.0 .. height = 100.0);
  om.addItem(new Oxygen()..initialize(4600.0, 290.0));
  
  
  // screen 5.5
  om.addBlock(new Block()..initialize(4950.0, 420.0) // floor
      ..width = 300.0 .. height = 140.0);
  om.addBlock(new Block()..initialize(5200.0, 500.0) // floor
      ..width = 50.0 .. height = 101.0);
  om.addItem(new Oxygen()..initialize(5200.0, 400.0));

  //om.addItem(new ShipItem()..initialize(5000.0, 290.0));
  
  
  //screen 6
  om.addBlock(new Block()..initialize(5400.0, 420.0) // floor
      ..width = 700.0 .. height = 140.0);
  om.addItem(new Oxygen()..initialize(4900.0, 290.0));
  om.addItem(new Oxygen()..initialize(4950.0, 290.0));
  om.addItem(new Oxygen()..initialize(5000.0, 290.0));
  om.addItem(new Oxygen()..initialize(5050.0, 290.0));
  om.addItem(new Oxygen()..initialize(5100.0, 290.0));
  om.addItem(new Oxygen()..initialize(5150.0, 290.0));
  om.addItem(new Oxygen()..initialize(5200.0, 290.0));
  
  om.addEnemy(new Alien()..initialize(5400.0, 330.0));
  om.addBlock(new Block()..initialize(5900.0, 320.0) // floor
      ..width = 100.0 .. height = 101.0);
  om.addItem(new Oxygen()..initialize(5900.0, 220.0));
  om.addBlock(new Block()..initialize(6100.0, 220.0) // floor
      ..width = 100.0 .. height = 101.0);
  om.addItem(new Oxygen()..initialize(6100.0, 120.0));
  om.addBlock(new Block()..initialize(6300.0, 120.0) // floor
      ..width = 100.0 .. height = 101.0);
  om.addItem(new Oxygen()..initialize(6300.0, 20.0));
  om.addBlock(new Block()..initialize(6500.0, 220.0) // floor
      ..width = 100.0 .. height = 101.0);
  om.addItem(new Oxygen()..initialize(6500.0, 120.0));
  om.addBlock(new Block()..initialize(6700.0, 320.0) // floor
      ..width = 100.0 .. height = 101.0);
  om.addItem(new Oxygen()..initialize(6700.0, 220.0));
  om.addBlock(new Block()..initialize(6900.0, 420.0) // floor
      ..width = 500.0 .. height = 140.0);
  om.addEnemy(new Spike()..initialize(7100.0, 340.0)
      ..width = 100.0 .. height = 20.0);
 
  //screen 7
  om.addBlock(new Block()..initialize(7400.0, 500.0) // floor
      ..width = 700.0 .. height = 101.0);
  om.addEnemy(new Alien()..initialize(7600.0, 430.0));
  om.addBlock(new Block()..initialize(7900.0, 420.0) // floor
      ..width = 300.0 .. height = 140.0);
  om.addBlock(new Block()..initialize(8300.0, 320.0) // floor
      ..width = 400.0 .. height = 400.0);
  om.addItem(new Oxygen()..initialize(7800.0, 100.0));
  om.addItem(new Oxygen()..initialize(7850.0, 100.0));
  om.addItem(new Oxygen()..initialize(7900.0, 100.0));
  om.addItem(new Oxygen()..initialize(7950.0, 100.0));
  om.addItem(new Oxygen()..initialize(8000.0, 100.0));
 
  
  //screen 8
  om.addBlock(new Block()..initialize(9400.0, 420.0) // floor
      ..width = 1500.0 .. height = 140.0);
  om.addBlock(new Block()..initialize(9000.0, 300.0) // Boulder
      ..width = 120.0 .. height = 100.0);  
  om.addBlock(new Block()..initialize(9350.0, 120.0) // floor
      ..width = 300.0 .. height = 140.0);
  om.addItem(new Oxygen()..initialize(9350.0, 0.0));
  om.addItem(new Oxygen()..initialize(9400.0, 0.0));
  om.addItem(new Oxygen()..initialize(9450.0, 0.0));
  om.addItem(new Oxygen()..initialize(9500.0, 0.0));
  
  om.addBlock(new Block()..initialize(9800.0, 0.0) // floor
      ..width = 300.0 .. height = 140.0);
  om.addItem(new Oxygen()..initialize(9800.0, -120.0));
  om.addItem(new Oxygen()..initialize(9850.0, -120.0));
  om.addItem(new Oxygen()..initialize(9900.0, -120.0));
  om.addItem(new Oxygen()..initialize(9950.0, -120.0));
  
  om.addItem(new Oxygen()..initialize(9600.0, 290.0));
  om.addItem(new Oxygen()..initialize(9650.0, 290.0));
  om.addItem(new Oxygen()..initialize(9700.0, 290.0));
  om.addItem(new Oxygen()..initialize(9750.0, 290.0));
  om.addItem(new Oxygen()..initialize(9800.0, 290.0));
  
  om.addItem(new Oxygen()..initialize(10140.0, -150.0));
  om.addItem(new Oxygen()..initialize(10180.0, -150.0));
  //om.addItem(new Oxygen()..initialize(10180.0, -150.0));
  

  om.addBlock(new Block()..initialize(10250.0, 500.0) // floor
      ..width = 200.0 .. height = 101.0);
 
  om.addItem(new Oxygen()..initialize(10200.0, 380.0));
  om.addItem(new Oxygen()..initialize(10250.0, 380.0));
  om.addItem(new Oxygen()..initialize(10300.0, 380.0));
  
  
  //screen 9
  om.addBlock(new Block()..initialize(10550.0, 420.0) // floor
      ..width = 400.0 .. height = 140.0);
  
  om.addBlock(new Block()..initialize(11200.0, 350.0) // floor
      ..width = 600.0 .. height = 240.0);
  om.addItem(new Oxygen()..initialize(11000.0, 160.0));
    om.addItem(new Oxygen()..initialize(11050.0, 160.0));
    om.addItem(new Oxygen()..initialize(11100.0, 160.0));
    om.addItem(new Oxygen()..initialize(11150.0, 160.0));
    om.addItem(new Oxygen()..initialize(11200.0, 160.0));
  
  om.addEnemy(new Droid()..initialize(11400.0, 185.0));
  
  om.addBlock(new Block()..initialize(12100.0, 420.0) // floor
      ..width = 1500.0 .. height = 140.0);
  om.addBlock(new Block()..initialize(11800.0, 100.0)
      ..width = 300.0 .. height = 101.0);
  
  Block bossFloor = (new Block()..initialize(13070.0, 420.0) // boss floor
  ..width = 440.0 .. height = 140.0);
  om.addBlock(bossFloor);
  
  om.addItem(new Oxygen()..initialize(11800.0, -20.0));
  om.addItem(new Oxygen()..initialize(11850.0, -20.0));
  om.addItem(new Oxygen()..initialize(11900.0, -20.0));
  om.addItem(new Oxygen()..initialize(11950.0, -20.0));
  
  om.addItem(new Oxygen()..initialize(12200.0, -20.0));
  
  //screen 10
  om.addItem(new Oxygen()..initialize(12300.0, 290.0));
  om.addItem(new Oxygen()..initialize(12350.0, 290.0));
  om.addItem(new Oxygen()..initialize(12400.0, 290.0));
  om.addItem(new Oxygen()..initialize(12450.0, 290.0));
  om.addItem(new Oxygen()..initialize(12500.0, 290.0));
  om.addItem(new Oxygen()..initialize(12550.0, 290.0));
  om.addItem(new Oxygen()..initialize(12600.0, 290.0));
  om.addBlock(new Block()..initialize(12800.0, 300.0) // Boulder
      ..width = 120.0 .. height = 100.0);
  om.addBlock(new MovingBlock()..initializeMove(12900.0, 100.0, 13100.0, 1000.0) // moving block
      ..width = 100.0 .. height = 101.0..speedX = 5.0);
  
  
  //boss
  om.addBlock(new Block()..initialize(13545.0, 420.0) // trigger floor
        ..width = 520.0 .. height = 140.0);
  Trigger trigger = new Trigger()..initialize(13530.0, 340.0)
  ..width = 120.0 .. height = 20.0;
  
  
  Enemy boss = (new Gorilla()..initialize(13100.0, 300.0));
  om.addEnemy(boss);
  
  
  
  Block floorObstacle = new Block()..initialize(13700.0, 200.0) // obstacle
  ..width = 200.0 .. height = 1000.0 ..isObstacle = true;
  om.addBlock(floorObstacle);
  
  trigger.setTriggerObjects(bossFloor, boss, floorObstacle);
  om.addTrigger(trigger);
  
  om.addBlock(new Block()..initialize(13900.0, 420.0) 
          ..width = 200.0 .. height = 140.0);
  
  Game.instance.level2Oxygen = om.itemList.length;    //count total oxygen
  
  om.addItem(new ShipItem()..initialize(13900.0, 290.0)
      ..level = 2);
  
}