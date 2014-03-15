part of gdp;

void setupLevelFour() {
  
  Game.instance.currentLevel = LevelManager.enumLevelFour;
  Globals.setBackground();

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
  om.addBlock(new Block()..initialize(450.0, 100.0) // high floor
      ..width = 100.0 .. height = 101.0);
  
  om.addItem(new Oxygen()..initialize(400.0, 200.0));
  om.addItem(new Oxygen()..initialize(450.0, 200.0));
  om.addItem(new Oxygen()..initialize(500.0, 200.0));
  om.addItem(new Oxygen()..initialize(550.0, 200.0));
  om.addItem(new Oxygen()..initialize(600.0, 200.0));
  om.addItem(new Oxygen()..initialize(650.0, 200.0));
  om.addItem(new Oxygen()..initialize(700.0, 200.0));
  om.addItem(new Oxygen()..initialize(750.0, 200.0));
  om.addItem(new Oxygen()..initialize(800.0, 200.0));
  om.addItem(new Oxygen()..initialize(850.0, 200.0));
  
  om.addBlock(new MovingBlock()..initializeMove(400.0, 300.0, 800.0, 300.0) // moving block
      ..width = 200.0 .. height = 101.0..speedX = 4.0);
  om.addBlock(new Block()..initialize(1200.0, 300.0) // floor
      ..width = 600.0 .. height = 340.0);
  om.addEnemy(new Alien()..initialize(1400.0, 110.0));  //enemy
  /*om.addBlock(new Block()..initialize(800.0, 500.0) // low floor
      ..width = 600.0 .. height = 140.0);*/
  
  
  //screen 2 & screen 3
  om.addBlock(new MovingBlock()..initializeMove(1600.0, 500.0, 1790.0, 500.0) // moving block
      ..width = 150.0 .. height = 140.0..speedX = 3.0);
  om.addBlock(new Block()..initialize(2000.0, 420.0) // floor
      ..width = 200.0 .. height = 140.0);
  om.addItem(new Oxygen()..initialize(1950.0, 300.0));
  om.addItem(new Oxygen()..initialize(2000.0, 300.0));
  om.addItem(new Oxygen()..initialize(2050.0, 300.0));
  om.addItem(new Oxygen()..initialize(2100.0, 300.0));
  
  om.addBlock(new Block()..initialize(2400.0, 350.0) // high floor
      ..width = 300.0 .. height = 250.0);
  om.addEnemy(new Spike()..initialize(2450.0, 215.0)  //spike
        ..width = 100.0 .. height = 20.0);
  om.addBlock(new Block()..initialize(2600.0, 500.0) // low floor
      ..width = 200.0 .. height = 140.0);
  om.addEnemy(new Alien()..initialize(2610.0, 410.0)
      ..JUMP=true ..STATIONARY=true);  //enemy
  /*om.addEnemy(new Gorilla()..initialize(2600.0, 350.0)
      ..STATIONARY=true);  //enemy
      */
  
  om.addBlock(new Block()..initialize(3700.0, 420.0) //  floor
      ..width = 2000.0 .. height = 110.0);
  
  
  om.addItem(new Oxygen()..initialize(2800.0, 320.0));
  om.addItem(new Oxygen()..initialize(2850.0, 320.0));
  om.addItem(new Oxygen()..initialize(2900.0, 320.0));
  om.addItem(new Oxygen()..initialize(2950.0, 320.0));
  om.addItem(new Oxygen()..initialize(3000.0, 320.0));
  om.addItem(new Oxygen()..initialize(3050.0, 320.0));
  om.addItem(new Oxygen()..initialize(3100.0, 280.0));
  om.addItem(new Oxygen()..initialize(3150.0, 240.0));
  om.addItem(new Oxygen()..initialize(3200.0, 200.0));
  om.addItem(new Oxygen()..initialize(3250.0, 240.0));
  om.addItem(new Oxygen()..initialize(3300.0, 280.0));
  om.addItem(new Oxygen()..initialize(3350.0, 320.0));
  om.addItem(new Oxygen()..initialize(3400.0, 320.0));

  /*
  om.addBlock(new Block()..initialize(3200.0, 320.0) // Boulder
        ..width = 120.0 .. height = 100.0);
  om.addBlock(new MovingBlock()..initializeMove(3300.0, 100.0, 4100.0, 100.0) // moving block
      ..width = 150.0 .. height = 101.0..speedX = 7.0);
  */
  
  om.addEnemy(new Spike()..initialize(3500.0, 355.0)  //spike
        ..width = 100.0 .. height = 20.0);
  om.addItem(new Oxygen()..initialize(3600.0, 320.0));
  om.addItem(new Oxygen()..initialize(3650.0, 260.0));
  om.addItem(new Oxygen()..initialize(3700.0, 200.0));
  om.addItem(new Oxygen()..initialize(3750.0, 260.0));
  //om.addItem(new Oxygen()..initialize(3800.0, 320.0));
  
  om.addEnemy(new Spike()..initialize(3700.0, 355.0)  //spike
        ..width = 100.0 .. height = 20.0);
  om.addItem(new Oxygen()..initialize(3800.0, 320.0));
  om.addItem(new Oxygen()..initialize(3850.0, 260.0));
  om.addItem(new Oxygen()..initialize(3900.0, 200.0));
  om.addItem(new Oxygen()..initialize(3950.0, 260.0));
 // om.addItem(new Oxygen()..initialize(4000.0, 320.0));
  
  om.addEnemy(new Spike()..initialize(3900.0, 355.0)  //spike
        ..width = 100.0 .. height = 20.0);
  om.addItem(new Oxygen()..initialize(4000.0, 320.0));
  om.addItem(new Oxygen()..initialize(4050.0, 260.0));
  om.addItem(new Oxygen()..initialize(4100.0, 200.0));
  om.addItem(new Oxygen()..initialize(4150.0, 260.0));
  //om.addItem(new Oxygen()..initialize(4200.0, 320.0));
  
  om.addEnemy(new Spike()..initialize(4100.0, 355.0)  //spike
        ..width = 100.0 .. height = 20.0);
  om.addItem(new Oxygen()..initialize(4200.0, 320.0));
  om.addItem(new Oxygen()..initialize(4250.0, 260.0));
  om.addItem(new Oxygen()..initialize(4300.0, 200.0));
  om.addItem(new Oxygen()..initialize(4350.0, 260.0));
  om.addItem(new Oxygen()..initialize(4400.0, 320.0));
  
  om.addEnemy(new Spike()..initialize(4300.0, 355.0)  //spike
        ..width = 100.0 .. height = 20.0);
  om.addBlock(new Spring()..initialize(4650.0, 283.0));   //spring
  
  
  
  //screen 4
  om.addBlock(new Block()..initialize(5000.0, 530.0) // low floor
      ..width = 600.0 .. height = 140.0);
  /*om.addItem(new Oxygen()..initialize(4900.0, 420.0));
  om.addItem(new Oxygen()..initialize(4950.0, 420.0));
  om.addItem(new Oxygen()..initialize(5000.0, 420.0));
  om.addItem(new Oxygen()..initialize(5050.0, 420.0));
  om.addItem(new Oxygen()..initialize(5100.0, 420.0));
  om.addItem(new Oxygen()..initialize(5150.0, 420.0));
  */
  om.addEnemy(new Gorilla()..initialize(5000.0, 400.0));  //enemy

  om.addBlock(new Spring()..initialize(5250.0, 380.0));   //spring
  om.addBlock(new Block()..initialize(4950.0, -250.0) // high floor
      ..width = 300.0 .. height = 101.0);
  om.addItem(new Oxygen()..initialize(4800.0, -325.0));
  om.addItem(new Oxygen()..initialize(4850.0, -325.0));
  om.addItem(new Oxygen()..initialize(4900.0, -325.0));
  om.addItem(new Oxygen()..initialize(4950.0, -325.0));
  om.addItem(new Oxygen()..initialize(5000.0, -325.0));
  om.addItem(new Oxygen()..initialize(5050.0, -325.0));
  
  /*om.addItem(new Oxygen()..initialize(4800.0, -375.0));
  om.addItem(new Oxygen()..initialize(4850.0, -375.0));
  om.addItem(new Oxygen()..initialize(4900.0, -375.0));
  om.addItem(new Oxygen()..initialize(4950.0, -375.0));
  om.addItem(new Oxygen()..initialize(5000.0, -375.0));
  om.addItem(new Oxygen()..initialize(5050.0, -375.0));
  */
  
  om.addBlock(new Block()..initialize(5600.0, 420.0) // floor
      ..width = 600.0 .. height = 140.0);
  om.addEnemy(new Droid()..initialize(5600.0, 300.0)
      ..endPos = 5600.0-200.0);                      //enemy
  om.addEnemy(new Alien()..initialize(6100.0, 410.0)
      ..JUMP=true);                                  //enemy
  
  om.addEnemy(new Alien()..initialize(6400.0, 330.0)
      ..JUMP=false);                                  //enemy
  
  om.addBlock(new Block()..initialize(6000.0, 500.0) // low floor
      ..width = 300.0 .. height = 140.0);
  om.addBlock(new Block()..initialize(6450.0, 420.0) // floor
      ..width = 600.0 .. height = 140.0);
  
  
  om.addBlock(new Block()..initialize(5500.0, -150.0) // high floor
      ..width = 100.0 .. height = 101.0);
  om.addBlock(new MovingBlock()..initializeMove(5675.0, 25.0, 6000.0, 25.0) // moving block
      ..width = 200.0 .. height = 101.0..speedX = 3.0);
  om.addBlock(new Block()..initialize(6300.0, 0.0) // high floor
      ..width = 200.0 .. height = 101.0);
  om.addItem(new Oxygen()..initialize(6250.0, -75.0));
  om.addItem(new Oxygen()..initialize(6300.0, -75.0));
  om.addItem(new Oxygen()..initialize(6350.0, -75.0));
  om.addItem(new Oxygen()..initialize(6400.0, -75.0));
  
  /*om.addItem(new Oxygen()..initialize(6050.0, -125.0));
  om.addItem(new Oxygen()..initialize(6100.0, -125.0));
  om.addItem(new Oxygen()..initialize(6150.0, -125.0));
  om.addItem(new Oxygen()..initialize(6200.0, -125.0));
  */
  
  //screen 5
  //om.addBlock(new Block()..initialize(7000.0, 420.0) // high floor
  //    ..width = 100.0 .. height = 101.0);
  om.addBlock(new Spring()..initialize(6900.0, 400.0));   //spring
  om.addBlock(new Block()..initialize(7600.0, 420.0) // floor
      ..width = 400.0 .. height = 140.0);
  om.addEnemy(new Spike()..initialize(7600.0, 345.0)  //spike
        ..width = 100.0 .. height = 20.0);
  
  om.addBlock(new Block()..initialize(7900.0, 340.0) // high floor1
      ..width = 200.0 .. height = 360.0);
  om.addItem(new Oxygen()..initialize(7900.0, 120.0));
  om.addItem(new Oxygen()..initialize(7950.0, 120.0));
  
  om.addBlock(new Block()..initialize(8100.0, 280.0) // high floor2
      ..width = 200.0 .. height = 430.0);
  om.addItem(new Oxygen()..initialize(8100.0, 20.0));
  om.addItem(new Oxygen()..initialize(8150.0, 20.0));
  
  om.addBlock(new Block()..initialize(8300.0, 220.0) // high floor3
      ..width = 200.0 .. height = 500.0);
  om.addItem(new Oxygen()..initialize(8300.0, -80.0));
  om.addItem(new Oxygen()..initialize(8350.0, -80.0));
  
  om.addBlock(new Block()..initialize(8500.0, 160.0) // high floor4
      ..width = 200.0 .. height = 620.0);
  om.addItem(new Oxygen()..initialize(8500.0, -180.0));
  om.addItem(new Oxygen()..initialize(8550.0, -180.0));
  
  om.addBlock(new VerticalBlock()..initializeMove(8700.0, 0.0, 8700.0, 500.0) // vertical block
      ..width = 100.0 .. height = 101.0..speedY = 5.0);
  
  om.addItem(new Oxygen()..initialize(8650.0, 0.0));
  om.addItem(new Oxygen()..initialize(8650.0, 50.0));
  om.addItem(new Oxygen()..initialize(8650.0, 100.0));
  om.addItem(new Oxygen()..initialize(8650.0, 150.0));
  om.addItem(new Oxygen()..initialize(8650.0, 200.0));
  om.addItem(new Oxygen()..initialize(8650.0, 250.0));
  om.addItem(new Oxygen()..initialize(8650.0, 300.0));
  om.addItem(new Oxygen()..initialize(8650.0, 350.0));
  
  
  om.addItem(new Oxygen()..initialize(8700.0, 0.0));
  om.addItem(new Oxygen()..initialize(8700.0, 50.0));
  om.addItem(new Oxygen()..initialize(8700.0, 100.0));
  om.addItem(new Oxygen()..initialize(8700.0, 150.0));
  om.addItem(new Oxygen()..initialize(8700.0, 200.0));
  om.addItem(new Oxygen()..initialize(8700.0, 250.0));
  om.addItem(new Oxygen()..initialize(8700.0, 300.0));
  om.addItem(new Oxygen()..initialize(8700.0, 350.0));
  /*
  om.addItem(new Oxygen()..initialize(8750.0, 0.0));
  om.addItem(new Oxygen()..initialize(8750.0, 50.0));
  om.addItem(new Oxygen()..initialize(8750.0, 100.0));
  om.addItem(new Oxygen()..initialize(8750.0, 150.0));
  om.addItem(new Oxygen()..initialize(8750.0, 200.0));
  om.addItem(new Oxygen()..initialize(8750.0, 250.0));
  om.addItem(new Oxygen()..initialize(8750.0, 300.0));
  om.addItem(new Oxygen()..initialize(8750.0, 350.0));
  */
  om.addBlock(new Block()..initialize(8900.0, 160.0) // high floor4
      ..width = 200.0 .. height = 620.0);
  
  
  //screen 6
  om.addBlock(new Block()..initialize(9100.0, 420.0) // floor
      ..width = 50.0 .. height = 140.0);
  om.addItem(new Oxygen()..initialize(9100.0, 320.0));


  om.addBlock(new Block()..initialize(9300.0, 420.0) // floor
      ..width = 50.0 .. height = 140.0);
  om.addItem(new Oxygen()..initialize(9300.0, 320.0));

  om.addBlock(new Block()..initialize(9500.0, 420.0) // floor
      ..width = 50.0 .. height = 140.0);
  om.addItem(new Oxygen()..initialize(9500.0, 320.0));
  
  om.addBlock(new Block()..initialize(9750.0, 420.0) // floor
      ..width = 50.0 .. height = 140.0);
  om.addItem(new Oxygen()..initialize(9750.0, 320.0));
  
  om.addBlock(new Block()..initialize(10350.0, 420.0) // floor
      ..width = 800.0 .. height = 140.0);
  om.addBlock(new Block()..initialize(10000.0, 300.0) // Boulder
        ..width = 120.0 .. height = 100.0);
  om.addBlock(new Block()..initialize(10250.0, 100.0) // high floor
      ..width = 100.0 .. height = 101.0);
  om.addItem(new Oxygen()..initialize(10200.0, 0.0));
  om.addItem(new Oxygen()..initialize(10250.0, 0.0));
  
  om.addEnemy(new clone()..initialize(10550.0, 290.0));  //enemy
  /*om.addItem(new Oxygen()..initialize(10400.0, 320.0));
  om.addItem(new Oxygen()..initialize(10450.0, 320.0));
  om.addItem(new Oxygen()..initialize(10500.0, 320.0));
  om.addItem(new Oxygen()..initialize(10550.0, 320.0));
  om.addItem(new Oxygen()..initialize(10600.0, 320.0));
  om.addItem(new Oxygen()..initialize(10650.0, 320.0));
  om.addItem(new Oxygen()..initialize(10700.0, 320.0));
*/
  
  //screen 7
  om.addBlock(new Block()..initialize(10960.0, 420.0) // floor
      ..width = 50.0 .. height = 140.0);
  om.addBlock(new DiagonalBlock()..initializeMove(11350.0, -100.0, 11450.0, 400.0) // diagonal block
      ..width = 100.0 .. height = 101.0..speedY = 4.0);
  //om.addItem(new Oxygen()..initialize(11100.0, 50.0));
  //om.addItem(new Oxygen()..initialize(11125.0, 25.0));
  //om.addItem(new Oxygen()..initialize(11150.0, 0.0));
  /*om.addItem(new Oxygen()..initialize(11175.0, -25.0));
  om.addItem(new Oxygen()..initialize(11200.0, -50.0));
  om.addItem(new Oxygen()..initialize(11225.0, -75.0));
  om.addItem(new Oxygen()..initialize(11250.0, -100.0));
  om.addItem(new Oxygen()..initialize(11275.0, -125.0));
  om.addItem(new Oxygen()..initialize(11300.0, -150.0));
  om.addItem(new Oxygen()..initialize(11325.0, -175.0));
  om.addItem(new Oxygen()..initialize(11350.0, -200.0));
  */
  
  om.addItem(new Oxygen()..initialize(11225.0, -100.0));
  om.addItem(new Oxygen()..initialize(11250.0, -125.0));
  om.addItem(new Oxygen()..initialize(11275.0, -150.0));
  om.addItem(new Oxygen()..initialize(11300.0, -175.0));
  om.addItem(new Oxygen()..initialize(11325.0, -200.0));
  om.addItem(new Oxygen()..initialize(11350.0, -225.0));
  om.addItem(new Oxygen()..initialize(11375.0, -250.0));
  om.addItem(new Oxygen()..initialize(11400.0, -275.0));
  
  om.addBlock(new MovingBlock()..initializeMove(11400.0, 100.0, 11700.0, 100.0) // moving block
      ..width = 200.0 .. height = 101.0..speedX = 3.0);
  om.addBlock(new MovingBlock()..initializeMove(11500.0, 400.0, 12100.0, 400.0) // moving block
      ..width = 150.0 .. height = 101.0..speedX = 4.0);
 /* om.addItem(new Oxygen()..initialize(11600.0, 325.0));
  om.addItem(new Oxygen()..initialize(11625.0, 325.0));
  om.addItem(new Oxygen()..initialize(11650.0, 325.0));
  om.addItem(new Oxygen()..initialize(11675.0, 325.0));
  om.addItem(new Oxygen()..initialize(11700.0, 325.0));
  om.addItem(new Oxygen()..initialize(11725.0, 325.0));
  om.addItem(new Oxygen()..initialize(11750.0, 325.0));
  om.addItem(new Oxygen()..initialize(11775.0, 325.0));
  om.addItem(new Oxygen()..initialize(11800.0, 325.0));
  om.addItem(new Oxygen()..initialize(11825.0, 325.0));
  om.addItem(new Oxygen()..initialize(11850.0, 325.0));
  om.addItem(new Oxygen()..initialize(11875.0, 325.0));
  om.addItem(new Oxygen()..initialize(11900.0, 325.0));
  om.addItem(new Oxygen()..initialize(11925.0, 325.0));
  */
  om.addItem(new Oxygen()..initialize(11600.0, 300.0));
  om.addItem(new Oxygen()..initialize(11625.0, 300.0));
  om.addItem(new Oxygen()..initialize(11650.0, 300.0));
  om.addItem(new Oxygen()..initialize(11675.0, 300.0));
  om.addItem(new Oxygen()..initialize(11700.0, 300.0));
  om.addItem(new Oxygen()..initialize(11725.0, 300.0));
  om.addItem(new Oxygen()..initialize(11750.0, 300.0));
  om.addItem(new Oxygen()..initialize(11775.0, 300.0));
  om.addItem(new Oxygen()..initialize(11800.0, 300.0));
  om.addItem(new Oxygen()..initialize(11825.0, 300.0));
  om.addItem(new Oxygen()..initialize(11850.0, 300.0));
  om.addItem(new Oxygen()..initialize(11875.0, 300.0));
  om.addItem(new Oxygen()..initialize(11900.0, 300.0));
  om.addItem(new Oxygen()..initialize(11925.0, 300.0));
  
  
  om.addBlock(new Block()..initialize(11950.0, 0.0) // high block
      ..width = 100.0 .. height = 101.0);
  om.addItem(new Oxygen()..initialize(11925.0, -100.0));
  om.addItem(new Oxygen()..initialize(11975.0, -100.0));
  
  om.addBlock(new Block()..initialize(12400.0, 380.0) // floor
      ..width = 300.0 .. height = 180.0);
  om.addEnemy(new Spike()..initialize(12500.0, 280.0)  //spike
        ..width = 100.0 .. height = 20.0);
  /*om.addItem(new Oxygen()..initialize(12400.0, 200.0));
  om.addItem(new Oxygen()..initialize(12450.0, 150.0));
  om.addItem(new Oxygen()..initialize(12500.0, 100.0));
  om.addItem(new Oxygen()..initialize(12550.0, 200.0));
  */
  
  //screen 8
  om.addBlock(new Block()..initialize(13050.0, 500.0) // low floor
      ..width = 1000.0 .. height = 140.0);
  om.addItem(new Oxygen()..initialize(12600.0, 375.0));
  om.addItem(new Oxygen()..initialize(12650.0, 375.0));
  om.addItem(new Oxygen()..initialize(12700.0, 375.0));
  om.addItem(new Oxygen()..initialize(12750.0, 375.0));
  om.addItem(new Oxygen()..initialize(12800.0, 375.0));
  om.addItem(new Oxygen()..initialize(12850.0, 375.0));
  om.addItem(new Oxygen()..initialize(12900.0, 375.0));
  om.addItem(new Oxygen()..initialize(12950.0, 375.0));
  om.addItem(new Oxygen()..initialize(13000.0, 375.0));
  //om.addItem(new Oxygen()..initialize(13050.0, 420.0));
  
  Trigger trigger = new Trigger()..initialize(13100.0, 420.0)  //trigger
  ..width = 120.0 .. height = 20.0;
  Block floorObstacle = new Block()..initialize(13400.0, 80.0) // obstacle
   ..width = 200.0 .. height = 700.0 ..isObstacle = true;
   
   trigger.setTriggerObstacle(floorObstacle);
   om.addTrigger(trigger);
   om.addEnemy(new Spike()..initialize(13220.0, 420.0)    //spike
         ..width = 100.0 .. height = 20.0);
   om.addEnemy(new Alien()..initialize(13000.0, 410.0)
       ..STATIONARY=false);                                //enemy
   om.addBlock(floorObstacle);
   
   om.addBlock(new Block()..initialize(13750.0, 420.0) // floor
       ..width = 500.0 .. height = 140.0);
   om.addItem(new Oxygen()..initialize(13550.0, 300.0));
   om.addItem(new Oxygen()..initialize(13600.0, 300.0));
   om.addItem(new Oxygen()..initialize(13650.0, 300.0));
   om.addItem(new Oxygen()..initialize(13700.0, 300.0));
   om.addItem(new Oxygen()..initialize(13750.0, 300.0));
   om.addItem(new Oxygen()..initialize(13800.0, 300.0));
   om.addBlock(new Block()..initialize(13925.0, 300.0) // Boulder
         ..width = 120.0 .. height = 100.0);
   om.addBlock(new DiagonalBlock()..initializeMove(14000.0, -100.0, 14200.0, 400.0) // diagonal block
       ..width = 100.0 .. height = 101.0..speedY = 4.0 ..upToDown = true);
   
   
   
   //screen 9 / screen 10
   om.addBlock(new Block()..initialize(14425.0, 420.0)      // floor
       ..width = 100.0 .. height = 140.0);
   om.addBlock(new Spring()..initialize(14425.0, 270.0));   //spring
   om.addBlock(new Block()..initialize(15950.0, 420.0)      // floor
       ..width = 2000.0 .. height = 140.0);
   /*om.addItem(new Oxygen()..initialize(15900.0, 300.0));
   om.addItem(new Oxygen()..initialize(15950.0, 300.0));
   om.addItem(new Oxygen()..initialize(16000.0, 300.0));
   om.addItem(new Oxygen()..initialize(16050.0, 300.0));
   om.addItem(new Oxygen()..initialize(16100.0, 300.0));
   om.addItem(new Oxygen()..initialize(16150.0, 300.0));
   om.addItem(new Oxygen()..initialize(16200.0, 300.0));
   om.addItem(new Oxygen()..initialize(16250.0, 300.0));
   om.addItem(new Oxygen()..initialize(16300.0, 300.0));
   om.addItem(new Oxygen()..initialize(16350.0, 300.0));
   */
   om.addItem(new Oxygen()..initialize(16400.0, 300.0));
   om.addItem(new Oxygen()..initialize(16450.0, 300.0));
   om.addItem(new Oxygen()..initialize(16500.0, 300.0));
   om.addItem(new Oxygen()..initialize(16550.0, 300.0));
   om.addItem(new Oxygen()..initialize(16600.0, 300.0));
   om.addItem(new Oxygen()..initialize(16650.0, 300.0));
   om.addItem(new Oxygen()..initialize(16700.0, 300.0));
   om.addItem(new Oxygen()..initialize(16750.0, 300.0));
   om.addItem(new Oxygen()..initialize(16800.0, 300.0));
   om.addItem(new Oxygen()..initialize(16850.0, 300.0));
   om.addItem(new Oxygen()..initialize(16900.0, 300.0));
   
   om.addBlock(new Spring()..initialize(15000.0, 270.0));   //spring
    om.addEnemy(new Spike()..initialize(15200.0, 340.0)      //spike
         ..width = 100.0 .. height = 20.0);
    om.addBlock(new Block()..initialize(15300.0, 300.0)      // Boulder
         ..width = 120.0 .. height = 100.0);
    om.addEnemy(new Spike()..initialize(15420.0, 340.0)      //spike
         ..width = 100.0 .. height = 20.0);
    om.addEnemy(new Spike()..initialize(15540.0, 340.0)      //spike
         ..width = 100.0 .. height = 20.0);
    om.addEnemy(new Spike()..initialize(15660.0, 340.0)      //spike
         ..width = 100.0 .. height = 20.0);
   om.addBlock(new Block()..initialize(15500.0, -200.0)      // high floor
       ..width = 200.0 .. height = 101.0);
   om.addItem(new Oxygen()..initialize(15400.0, -280.0));
   om.addItem(new Oxygen()..initialize(15450.0, -280.0));
   om.addItem(new Oxygen()..initialize(15500.0, -280.0));
   om.addItem(new Oxygen()..initialize(15550.0, -280.0));
   om.addItem(new Oxygen()..initialize(15600.0, -280.0));
   
   om.addItem(new Oxygen()..initialize(15400.0, -330.0));
   om.addItem(new Oxygen()..initialize(15450.0, -330.0));
   om.addItem(new Oxygen()..initialize(15500.0, -330.0));
   om.addItem(new Oxygen()..initialize(15550.0, -330.0));
   om.addItem(new Oxygen()..initialize(15600.0, -330.0));
   
   //screen 11
   om.addBlock(new Block()..initialize(17350.0, 300.0)      // floor
       ..width = 500.0 .. height = 140.0);
   om.addEnemy(new Droid()..initialize(17500.0, 190.0));  //enemy
   om.addBlock(new Block()..initialize(17700.0, 50.0)      // high floor
       ..width = 150.0 .. height = 101.0);
   om.addBlock(new Block()..initialize(18000.0, 150.0)      // high floor
       ..width = 150.0 .. height = 101.0);
   om.addItem(new Oxygen()..initialize(17950.0, 50.0));
   om.addItem(new Oxygen()..initialize(18000.0, 50.0));
   om.addItem(new Oxygen()..initialize(18050.0, 50.0));
   om.addBlock(new Block()..initialize(18200.0, 250.0)      // high floor
       ..width = 150.0 .. height = 101.0);
   om.addEnemy(new Spike()..initialize(18175.0, 190.0)      //spike
        ..width = 100.0 .. height = 20.0);
   om.addBlock(new Block()..initialize(18350.0, 475.0)      // low floor
       ..width = 50.0 .. height = 101.0);
   om.addEnemy(new Alien()..initialize(18350.0, 400.0)
       ..STATIONARY=true ..JUMP=true);  //enemy
   
   //screen 12
   om.addBlock(new Block()..initialize(18500.0, 250.0)      // high floor
       ..width = 150.0 .. height = 101.0);
    om.addBlock(new Block()..initialize(18700.0, 50.0)      // high floor
       ..width = 150.0 .. height = 101.0);
    om.addItem(new Oxygen()..initialize(18650.0, -50.0));
    om.addItem(new Oxygen()..initialize(18700.0, -50.0));
    om.addItem(new Oxygen()..initialize(18750.0, -50.0));
    om.addBlock(new Block()..initialize(18900.0, -150.0)      // high floor
       ..width = 150.0 .. height = 101.0);
    om.addBlock(new MovingBlock()..initializeMove(18800.0, 500.0, 19100.0, 500.0) // moving block
        ..width = 150.0 .. height = 101.0..speedX = 3.0);
    om.addItem(new Oxygen()..initialize(18800.0, 400.0));
    om.addItem(new Oxygen()..initialize(18825.0, 400.0));
    om.addItem(new Oxygen()..initialize(18850.0, 400.0));
    om.addItem(new Oxygen()..initialize(18875.0, 400.0));
    om.addItem(new Oxygen()..initialize(18900.0, 400.0));
    om.addItem(new Oxygen()..initialize(18925.0, 400.0));
    om.addItem(new Oxygen()..initialize(18950.0, 400.0));
    om.addItem(new Oxygen()..initialize(18975.0, 400.0));
    om.addItem(new Oxygen()..initialize(19000.0, 400.0));
    om.addItem(new Oxygen()..initialize(19025.0, 400.0));
    om.addItem(new Oxygen()..initialize(19050.0, 400.0));
    om.addItem(new Oxygen()..initialize(19075.0, 400.0));
    
    /*om.addItem(new Oxygen()..initialize(18800.0, 425.0));
    om.addItem(new Oxygen()..initialize(18825.0, 425.0));
    om.addItem(new Oxygen()..initialize(18850.0, 425.0));
    om.addItem(new Oxygen()..initialize(18875.0, 425.0));
    om.addItem(new Oxygen()..initialize(18900.0, 425.0));
    om.addItem(new Oxygen()..initialize(18925.0, 425.0));
    om.addItem(new Oxygen()..initialize(18950.0, 425.0));
    om.addItem(new Oxygen()..initialize(18975.0, 425.0));
    om.addItem(new Oxygen()..initialize(19000.0, 425.0));
    om.addItem(new Oxygen()..initialize(19025.0, 425.0));
    om.addItem(new Oxygen()..initialize(19050.0, 425.0));
    om.addItem(new Oxygen()..initialize(19075.0, 425.0));
    */
    
    om.addBlock(new Block()..initialize(19300.0, 380.0)      // floor
       ..width = 200.0 .. height = 200.0);
    om.addEnemy(new Spike()..initialize(19350.0, 270.0)      //spike
         ..width = 100.0 .. height = 20.0);
    
    
   //screen 13
    om.addBlock(new Block()..initialize(20150.0, 460.0)      // floor
       ..width = 1500.0 .. height = 200.0);
    om.addEnemy(new Alien()..initialize(19600.0, 340.0));  //enemy
    om.addBlock(new Block()..initialize(20000.0, 310.0)      // Boulder
         ..width = 120.0 .. height = 100.0);
    om.addBlock(new Block()..initialize(20200.0, 100.0)      // high floor
        ..width = 100.0 .. height = 101.0);
    
    om.addBlock(new Block()..initialize(20400.0, -100.0)      // high floor
        ..width = 150.0 .. height = 101.0);
    om.addBlock(new Block()..initialize(20500.0, 100.0)      // high floor
        ..width = 300.0 .. height = 101.0);
    om.addItem(new Oxygen()..initialize(20350.0, 0.0));
    om.addItem(new Oxygen()..initialize(20400.0, 0.0));
    om.addItem(new Oxygen()..initialize(20450.0, 0.0));
    om.addItem(new Oxygen()..initialize(20500.0, 0.0));
    om.addItem(new Oxygen()..initialize(20550.0, 0.0));
    om.addItem(new Oxygen()..initialize(20600.0, 0.0));
    om.addItem(new Oxygen()..initialize(20650.0, 0.0));

    
    om.addBlock(new Block()..initialize(20800.0, -100.0)      // high floor
        ..width = 150.0 .. height = 101.0);
    
    om.addBlock(new Block()..initialize(21100.0, -100.0)      // high floor
        ..width = 100.0 .. height = 101.0);
    om.addBlock(new Block()..initialize(21100.0, 100.0)      // high floor
        ..width = 300.0 .. height = 101.0);
    om.addItem(new Oxygen()..initialize(20950.0, 0.0));
    om.addItem(new Oxygen()..initialize(21000.0, 0.0));
    om.addItem(new Oxygen()..initialize(21050.0, 0.0));
    om.addItem(new Oxygen()..initialize(21100.0, 0.0));
    om.addItem(new Oxygen()..initialize(21150.0, 0.0));
    om.addItem(new Oxygen()..initialize(21200.0, 0.0));
    om.addItem(new Oxygen()..initialize(21250.0, 0.0));
 
    om.addBlock(new MovingBlock()..initializeMove(21300.0, -200.0, 21600.0, -200.0) // moving block
        ..width = 100.0 .. height = 101.0..speedX = 3.0);
    
    
    //screen 14
    om.addBlock(new Block()..initialize(21800.0, 0.0)      // high floor
        ..width = 400.0 .. height = 101.0);
    om.addItem(new Oxygen()..initialize(21700.0, -100.0));
    om.addItem(new Oxygen()..initialize(21750.0, -100.0));
    om.addItem(new Oxygen()..initialize(21800.0, -100.0));
    om.addItem(new Oxygen()..initialize(21850.0, -100.0));
    om.addItem(new Oxygen()..initialize(21900.0, -100.0));
    om.addItem(new Oxygen()..initialize(21950.0, -100.0));

    om.addBlock(new Block()..initialize(22050.0, 500.0)      // low floor
        ..width = 75.0 .. height = 101.0);
    om.addBlock(new Spring()..initialize(22050.0, 370.0));   //spring
    om.addBlock(new Block()..initialize(22400.0, 420.0)      // high floor
        ..width = 600.0 .. height = 101.0);
    om.addEnemy(new clone()..initialize(22600.0, 310.0));  //enemy

    om.addBlock(new Block()..initialize(22700.0, 0.0)      // high floor
        ..width = 400.0 .. height = 101.0);
    om.addEnemy(new Alien()..initialize(22800.0, -70.0));  //enemy
    om.addBlock(new DiagonalBlock()..initializeMove(23000.0, -100.0, 23300.0, 400.0) // diagonal block
        ..width = 100.0 .. height = 101.0..speedY = 4.0 ..upToDown = true);
    om.addBlock(new DiagonalBlock()..initializeMove(23600.0, -100.0, 23900.0, 400.0) // diagonal block
        ..width = 100.0 .. height = 101.0..speedY = 4.0);
    
    
    //screen 15
    om.addBlock(new Block()..initialize(24100.0, 220.0)      // floor
       ..width = 600.0 .. height = 500.0);
    om.addEnemy(new Spike()..initialize(24100.0, -40.0)      //spike
         ..width = 100.0 .. height = 20.0);
    om.addBlock(new Spring()..initialize(24350.0, -110.0));   //spring
    om.addBlock(new Block()..initialize(24600.0, 500.0)      // low floor
       ..width = 400.0 .. height = 140.0);

    om.addBlock(new VerticalBlock()..initializeMove(24500.0, 0.0, 24500.0, 300.0) // vertical block
        ..width = 100.0 .. height = 101.0..speedY = 3.0);
   /* om.addItem(new Oxygen()..initialize(24425.0, 350.0));
    om.addItem(new Oxygen()..initialize(24425.0, 325.0));
    om.addItem(new Oxygen()..initialize(24425.0, 300.0));
    om.addItem(new Oxygen()..initialize(24425.0, 275.0));
    om.addItem(new Oxygen()..initialize(24425.0, 250.0));
    om.addItem(new Oxygen()..initialize(24425.0, 225.0));
    om.addItem(new Oxygen()..initialize(24425.0, 200.0));
    om.addItem(new Oxygen()..initialize(24425.0, 175.0));
    om.addItem(new Oxygen()..initialize(24425.0, 150.0));
    om.addItem(new Oxygen()..initialize(24425.0, 125.0));
    om.addItem(new Oxygen()..initialize(24425.0, 100.0));
    om.addItem(new Oxygen()..initialize(24425.0, 75.0));
    om.addItem(new Oxygen()..initialize(24425.0, 50.0));
    om.addItem(new Oxygen()..initialize(24425.0, 25.0));
    om.addItem(new Oxygen()..initialize(24425.0, 0.0));
    */
    
    om.addItem(new Oxygen()..initialize(24600.0, 400.0));
    om.addItem(new Oxygen()..initialize(24625.0, 400.0));
    om.addItem(new Oxygen()..initialize(24650.0, 400.0));
    om.addItem(new Oxygen()..initialize(24675.0, 400.0));
    om.addItem(new Oxygen()..initialize(24700.0, 400.0));
    om.addItem(new Oxygen()..initialize(24725.0, 400.0));
    om.addItem(new Oxygen()..initialize(24750.0, 400.0));
    
    om.addItem(new Oxygen()..initialize(24600.0, 350.0));
    om.addItem(new Oxygen()..initialize(24625.0, 350.0));
    om.addItem(new Oxygen()..initialize(24650.0, 350.0));
    om.addItem(new Oxygen()..initialize(24675.0, 350.0));
    om.addItem(new Oxygen()..initialize(24700.0, 350.0));
    om.addItem(new Oxygen()..initialize(24725.0, 350.0));
    om.addItem(new Oxygen()..initialize(24750.0, 350.0));

    
    om.addBlock(new Block()..initialize(25200.0, 220.0)      // floor
       ..width = 500.0 .. height = 500.0);
    om.addEnemy(new Alien()..initialize(25300.0, -50.0));  //enemy
    
    
    
    //screen 16
    om.addBlock(new Block()..initialize(25700.0, 420.0)      // floor
       ..width = 75.0 .. height = 140.0);
    om.addBlock(new Spring()..initialize(25700.0, 300.0));   //spring
    
    om.addItem(new Oxygen()..initialize(25700.0, 150.0));
    om.addItem(new Oxygen()..initialize(25700.0, 125.0));
    om.addItem(new Oxygen()..initialize(25700.0, 100.0));
    om.addItem(new Oxygen()..initialize(25700.0, 75.0));
    om.addItem(new Oxygen()..initialize(25700.0, 50.0));
    om.addItem(new Oxygen()..initialize(25700.0, 25.0));
    om.addItem(new Oxygen()..initialize(25700.0, 0.0));
    om.addItem(new Oxygen()..initialize(25700.0, -75.0));
    om.addItem(new Oxygen()..initialize(25700.0, -50.0));
    om.addItem(new Oxygen()..initialize(25700.0, -25.0));
    om.addItem(new Oxygen()..initialize(25700.0, -100.0));
    om.addItem(new Oxygen()..initialize(25700.0, -125.0));
    om.addItem(new Oxygen()..initialize(25700.0, -150.0));
    om.addItem(new Oxygen()..initialize(25700.0, -175.0));
    om.addItem(new Oxygen()..initialize(25700.0, -200.0));
    
    om.addBlock(new Block()..initialize(26100.0, 420.0)      // floor
       ..width = 75.0 .. height = 140.0);
    om.addBlock(new Spring()..initialize(26100.0, 300.0));   //spring
    om.addItem(new Oxygen()..initialize(26100.0, 150.0));
    om.addItem(new Oxygen()..initialize(26100.0, 125.0));
    om.addItem(new Oxygen()..initialize(26100.0, 100.0));
    om.addItem(new Oxygen()..initialize(26100.0, 75.0));
    om.addItem(new Oxygen()..initialize(26100.0, 50.0));
    om.addItem(new Oxygen()..initialize(26100.0, 25.0));
    om.addItem(new Oxygen()..initialize(26100.0, 0.0));
    om.addItem(new Oxygen()..initialize(26100.0, -75.0));
    om.addItem(new Oxygen()..initialize(26100.0, -50.0));
    om.addItem(new Oxygen()..initialize(26100.0, -25.0));
    om.addItem(new Oxygen()..initialize(26100.0, -100.0));
    om.addItem(new Oxygen()..initialize(26100.0, -125.0));
    om.addItem(new Oxygen()..initialize(26100.0, -150.0));
    om.addItem(new Oxygen()..initialize(26100.0, -175.0));
    om.addItem(new Oxygen()..initialize(26100.0, -200.0));
    
    om.addBlock(new Block()..initialize(26500.0, 420.0)      // floor
       ..width = 75.0 .. height = 140.0);
    om.addBlock(new Spring()..initialize(26500.0, 300.0));   //spring
    om.addItem(new Oxygen()..initialize(26500.0, 150.0));
    om.addItem(new Oxygen()..initialize(26500.0, 125.0));
    om.addItem(new Oxygen()..initialize(26500.0, 100.0));
    om.addItem(new Oxygen()..initialize(26500.0, 75.0));
    om.addItem(new Oxygen()..initialize(26500.0, 50.0));
    om.addItem(new Oxygen()..initialize(26500.0, 25.0));
    om.addItem(new Oxygen()..initialize(26500.0, 0.0));
    om.addItem(new Oxygen()..initialize(26500.0, -75.0));
    om.addItem(new Oxygen()..initialize(26500.0, -50.0));
    om.addItem(new Oxygen()..initialize(26500.0, -25.0));
    om.addItem(new Oxygen()..initialize(26500.0, -100.0));
    om.addItem(new Oxygen()..initialize(26500.0, -125.0));
    om.addItem(new Oxygen()..initialize(26500.0, -150.0));
    om.addItem(new Oxygen()..initialize(26500.0, -175.0));
    om.addItem(new Oxygen()..initialize(26500.0, -200.0));
    
    
    //screen 17
    om.addBlock(new DiagonalBlock()..initializeMove(27000.0, -100.0, 27300.0, 400.0) // diagonal block
        ..width = 150.0 .. height = 101.0..speedY = 4.0);
    om.addBlock(new Block()..initialize(27300.0, 420.0)      // floor
       ..width = 600.0 .. height = 140.0);
    om.addBlock(new Block()..initialize(27400.0, -200.0)      // high floor
       ..width = 400.0 .. height = 101.0);
    om.addItem(new Oxygen()..initialize(27300.0, -300.0));
    om.addBlock(new Block()..initialize(27500.0, 300.0)      // Boulder
         ..width = 120.0 .. height = 100.0);
    
    
    //screen 18
    om.addBlock(new Block()..initialize(28350.0, 530.0)      // floor
       ..width = 1500.0 .. height = 140.0);
    
    om.addBlock(new Block()..initialize(27750.0, 100.0)      // high floor
       ..width = 150.0 .. height = 101.0);
    om.addBlock(new Block()..initialize(28000.0, -50.0)      // high floor
       ..width = 150.0 .. height = 101.0);
    om.addEnemy(new Alien()..initialize(28450.0, 440.0));  //enemy
    om.addEnemy(new clone()..initialize(28530.0, 395.0)
        ..STATIONARY=true);                               //enemy
    Trigger trigger2 = new Trigger()..initialize(28000.0, -110.0)  //trigger
    ..width = 120.0 .. height = 20.0;
    om.addBlock(new Spring()..initialize(28200.0, 380.0));   //spring
    
    
    Block floorObstacle2 = new Block()..initialize(28700.0, 110.0) // obstacle
     ..width = 200.0 .. height = 800.0 ..isObstacle = true;
     
     trigger2.setTriggerObstacle(floorObstacle2);
     om.addTrigger(trigger2);
     om.addBlock(floorObstacle2);
    
     
     
     //screen 19
     om.addBlock(new Block()..initialize(29650.0, 420.0)      // floor
        ..width = 1500.0 .. height = 140.0);
     
     
     om.addBlock(new Block()..initialize(30600.0, 460.0)      // floor
        ..width = 75.0 .. height = 140.0);
     om.addBlock(new Spring()..initialize(30600.0, 340.0));   //spring
     om.addItem(new ShipItem()..initialize(30600.0, -320.0)
           ..level = 4);
}
