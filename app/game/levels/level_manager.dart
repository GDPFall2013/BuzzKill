part of gdp;


class LevelManager {
 
  Alien alien = new Alien(300.0);
  Alien alien2 = new Alien(600.0); 
  loadLevel(int level, Player player) {
    ObjectManager om = new ObjectManager();
    SoundManager sm = new SoundManager();
    om.addObject(player);
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
    
//TODO Preload Sounds
    
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
    
    ShipItem shipItem = new ShipItem()
    ..initialize(400.0,viewportHeight - 200.0)
    ..width = 50.0
    ..height = 50.0;
    ObjectManager.instance.addObject(shipItem);
    ObjectManager.instance.itemList.add(shipItem);
  }
}