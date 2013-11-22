part of gdp;

void setupLevelTest() {
    ObjectManager om = ObjectManager.instance;
    om.addObject(Game.instance.player);
    
    // floor
    om.addBlock(new Block()..initialize(0.0, viewportHeight - 70.0)
        ..width = 640.0 .. height = 30.0);
    
    om.addEnemy(new Alien()..initialize(300.0, 0.0));
    om.addEnemy(new Alien()..initialize(600.0, 0.0));
    
    om.addEnemy(new Spike()..initialize(20.0, viewportHeight - 90.0)
        ..width = 100.0 .. height = 10.0);
    
    om.addItem(new Oxygen()..initialize(100.0, viewportHeight - 150.0));
    om.addItem(new Oxygen()..initialize(200.0, viewportHeight - 150.0));
    om.addItem(new Oxygen()..initialize(300.0, viewportHeight - 150.0));
    om.addItem(new Oxygen()..initialize(400.0, viewportHeight - 150.0));
    
    om.addItem(new ShipItem()..initialize(400.0, viewportHeight - 200.0));

}