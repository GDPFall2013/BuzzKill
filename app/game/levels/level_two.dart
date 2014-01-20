part of gdp;

void setupLevelTwo() {
  ObjectManager om = ObjectManager.instance;
  
  om.addObject(Game.instance.player);

  
  // screen 1
  om.addBlock(new Block()..initialize(200.0, 420.0) // floor
      ..width = 750.0 .. height = 140.0);
  
  om.addEnemy(new Spike()..initialize(200.0, 340.0)
      ..width = 100.0 .. height = 20.0);
  
  om.addBlock(new Block()..initialize(400.0, 300.0) // Boulder
      ..width = 120.0 .. height = 100.0);
  om.addBlock(new Block()..initialize(510.0, 300.0) // Boulder
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
  om.addBlock(new Block()..initialize(1400.0, 300.0) // Boulder
      ..width = 120.0 .. height = 100.0);

  
  // screen 2.5
  om.addItem(new Oxygen()..initialize(1150.0, 290.0));
  om.addItem(new Oxygen()..initialize(1200.0, 290.0));
  om.addItem(new Oxygen()..initialize(1250.0, 290.0));
  om.addEnemy(new Gorilla()..initialize(1700.0, 295.0));
  //om.addEnemy(new Spike()..initialize(1900.0, 340.0)
  //    ..width = 100.0 .. height = 20.0);
  
  
  // screen 3
  om.addBlock(new Block()..initialize(2350.0, 480.0) // floor
      ..width = 350.0 .. height = 140.0);

  
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
  om.addItem(new Oxygen()..initialize(8250.0, 200.0));
  om.addItem(new Oxygen()..initialize(8300.0, 200.0));
  om.addItem(new Oxygen()..initialize(8350.0, 200.0));
  om.addItem(new Oxygen()..initialize(8400.0, 200.0));
  om.addItem(new Oxygen()..initialize(8450.0, 200.0));
 
  
  //screen 8
  om.addBlock(new Block()..initialize(9400.0, 420.0) // floor
      ..width = 1500.0 .. height = 140.0);
  
}