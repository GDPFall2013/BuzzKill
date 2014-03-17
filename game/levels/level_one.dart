part of gdp;

void setupLevelOne() {
  Game.instance.currentLevel = LevelManager.enumLevelOne;
  Globals.setBackground();
  startMusic() {
      SoundManager.instance.setMusic(SoundManager.musicLevelOne);
      SoundManager.instance.startMusic();
    }
  print(Game.instance.menu.cheat);
  if(!Game.instance.menu.cheat){
   Game.instance.player.playerStartX = 0.0;
  }
    
  SoundManager.instance.loadMusic(SoundManager.musicLevelOne,  startMusic);
  
  ObjectManager om = ObjectManager.instance;
  
  om.addObject(Game.instance.player);

  //FOR TESTING, REMOVE
 // om.addEnemy(new CyraxShuriken()..initialize(400.0, 100.0));
// om.addEnemy(new Bullet()..initialize(400.0, 100.0));
 // om.addEnemy(new CyraxNet()..initialize(600.0, 100.0));
  //om.addEnemy(new CyraxMiniShuriken()..initialize(200.0, 100.0));
 // om.addEnemy(new Cyrax()..initialize(800.0, 200.0));
// om.addEnemy(new Gorilla()..initialize(800.0, 200.0));
  
  // screen 1
  om.addBlock(new Block()..initialize(875.0, 420.0) // floor
      ..width = 1750.0 .. height = 140.0);
  om.addItem(new Oxygen()..initialize(100.0, 290.0));
  om.addItem(new Oxygen()..initialize(150.0, 290.0));
  om.addItem(new Oxygen()..initialize(200.0, 290.0));
  
  om.addBlock(new Block()..initialize(330.0, 300.0) // Boulder
      ..width = 120.0 .. height = 100.0);
  
  om.addItem(new Oxygen()..initialize(440.0, 290.0));
  om.addItem(new Oxygen()..initialize(490.0, 290.0));
  
  
  // screen 1.5
  om.addItem(new Oxygen()..initialize(540.0, 290.0));
  
  om.addBlock(new Block()..initialize(640.0, 300.0) // Boulder
      ..width = 120.0 .. height = 100.0);
  om.addItem(new Oxygen()..initialize(730.0, 290.0));
  
  om.addEnemy(new Spike()..initialize(850.0, 340.0)
      ..width = 100.0 .. height = 20.0);
  
  
  // screen 2
  om.addItem(new Oxygen()..initialize(1050.0, 290.0));
  om.addItem(new Oxygen()..initialize(1100.0, 290.0));
  om.addItem(new Oxygen()..initialize(1150.0, 290.0));
  om.addItem(new Oxygen()..initialize(1200.0, 290.0));
  om.addBlock(new Block()..initialize(1300.0, 300.0) // Boulder
      ..width = 120.0 .. height = 100.0);
  
  om.addItem(new Oxygen()..initialize(1450.0, 290.0));
  om.addItem(new Oxygen()..initialize(1500.0, 290.0));
  om.addEnemy(new Spike()..initialize(1600.0, 340.0)
      ..width = 100.0 .. height = 20.0);
  om.addItem(new Oxygen()..initialize(1800.0, 200.0));
  
  
  // screen 2.5
 
  om.addBlock(new Block()..initialize(2875.0, 420.0) // Floor
      ..width = 1875.0 .. height = 140.0);
  
  
  // screen 3
  om.addItem(new Oxygen()..initialize(2000.0, 290.0));
  om.addItem(new Oxygen()..initialize(2050.0, 290.0));
  om.addItem(new Oxygen()..initialize(2100.0, 290.0));
  om.addItem(new Oxygen()..initialize(2150.0, 290.0));
  om.addBlock(new Block()..initialize(2300.0, 300.0) // Boulder
      ..width = 120.0 .. height = 100.0);

  
  // screen 3.5
  /*
  om.addItem(new Oxygen()..initialize(2500.0, 290.0));
  om.addItem(new Oxygen()..initialize(2550.0, 290.0));
  om.addItem(new Oxygen()..initialize(2600.0, 290.0));
  om.addItem(new Oxygen()..initialize(2650.0, 290.0));
  om.addItem(new Oxygen()..initialize(2700.0, 290.0));
  om.addItem(new Oxygen()..initialize(2750.0, 290.0));
  */
  om.addItem(new Oxygen()..initialize(2800.0, 290.0));
  om.addItem(new Oxygen()..initialize(2850.0, 290.0));
  om.addItem(new Oxygen()..initialize(2900.0, 290.0));
  
  
  // screen 4
  om.addEnemy(new Alien()..initialize(3250.0, 330.0));
  om.addEnemy(new Spike()..initialize(3500.0, 340.0)
      ..width = 100.0 .. height = 20.0);
  om.addItem(new Oxygen()..initialize(3600.0, 290.0));
  om.addItem(new Oxygen()..initialize(3650.0, 290.0));
  
  
  // screen 4.5
  om.addItem(new Oxygen()..initialize(3800.0, 290.0));
  //om.addItem(new Oxygen()..initialize(3850.0, 290.0));
  //om.addItem(new Oxygen()..initialize(3900.0, 290.0));
  om.addBlock(new Block()..initialize(4500.0, 420.0)
      ..width = 1060.0 .. height = 140.0);
  
  
  
  
  // screen 5
  om.addEnemy(new Alien()..initialize(4150.0, 330.0));
  om.addItem(new Oxygen()..initialize(4300.0, 290.0));
  om.addItem(new Oxygen()..initialize(4350.0, 290.0));
  om.addItem(new Oxygen()..initialize(4400.0, 290.0));  
  
  // screen 5.5
  om.addEnemy(new Alien()..initialize(4500.0, 330.0));
  om.addBlock(new Block()..initialize(4700.0, 300.0) // Boulder
      ..width = 120.0 .. height = 100.0);
  
  om.addItem(new ShipItem()..initialize(5000.0, 290.0)
      ..level = 1);
}