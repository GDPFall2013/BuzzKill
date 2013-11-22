part of gdp;

void setupLevelTest() {
  
    Alien alien = new Alien(300.0);
    Alien alien2 = new Alien(600.0); 
    ObjectManager om = new ObjectManager();
    SoundManager sm = new SoundManager();
    om.addObject(Game.instance.player);
    om.addObject(alien);
    om.enemyList.add(alien);
    
    om.addObject(alien2);
    om.enemyList.add(alien2);
    
    Block floor = new Block();
    floor.initialize(0.0, viewportHeight - 70.0);
    floor.width = viewportWidth - 0.0;  //TODO: convert this to double properly
    floor.height = 30.0;
    ObjectManager.instance.addObject(floor);
    ObjectManager.instance.blockList.add(floor);
    
    //Objects here for testing 
    
    Spike spike = new Spike()
    ..initialize(20.0,viewportHeight - 90.0)
    ..width = 100.0
    ..height = 10.0;
    ObjectManager.instance.addObject(spike);
    ObjectManager.instance.enemyList.add(spike);
    
    Oxygen oxygen = new Oxygen()
    ..initialize(100.0,viewportHeight - 150.0)
    ..width = 30.0
    ..height = 10.0;
    ObjectManager.instance.addObject(oxygen);
    ObjectManager.instance.itemList.add(oxygen);
    
    Oxygen oxygen2 = new Oxygen()
    ..initialize(200.0,viewportHeight - 150.0)
    ..width = 30.0
    ..height = 10.0;
    ObjectManager.instance.addObject(oxygen2);
    ObjectManager.instance.itemList.add(oxygen2);
    
    Oxygen oxygen3 = new Oxygen()
    ..initialize(300.0,viewportHeight - 150.0)
    ..width = 30.0
    ..height = 10.0;
    ObjectManager.instance.addObject(oxygen3);
    ObjectManager.instance.itemList.add(oxygen3);
    
    Oxygen oxygen4 = new Oxygen()
    ..initialize(400.0,viewportHeight - 150.0)
    ..width = 30.0
    ..height = 10.0;
    ObjectManager.instance.addObject(oxygen4);
    ObjectManager.instance.itemList.add(oxygen4);
    
    
    
    ShipItem shipItem = new ShipItem()
    ..initialize(400.0,viewportHeight - 200.0)
    ..width = 50.0
    ..height = 50.0;
    ObjectManager.instance.addObject(shipItem);
    ObjectManager.instance.itemList.add(shipItem);
  
  
}