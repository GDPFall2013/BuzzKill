part of gdp;

void setupLevelOne() {
  ObjectManager om = ObjectManager.instance;
  
  om.addObject(Game.instance.player);

  
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
  
  
  // screen 2.5
 
  om.addBlock(new Block()..initialize(2875.0, 420.0) // Floor
      ..width = 1875.0 .. height = 140.0);
  
  // screen 3
  
  
  // screen 3.5
  
  
  // screen 4
  
  
  // screen 4.5
  om.addBlock(new Block()..initialize(4500.0, 420.0)
      ..width = 1060.0 .. height = 140.0);
  
  // screen 5
  
  
  // screen 5.5
}