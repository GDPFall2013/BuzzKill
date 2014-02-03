part of gdp_test;

void objectManagerTest() {
  group('Object Manager: ', () {
    ObjectManager om = new ObjectManager();
    
    List<GameObject> goList = om.goList;
    List<GameObject> blockList = om.blockList;
    List<Enemy> enemyList = om.enemyList;
    List<Item> itemList = om.itemList;
    
    GameObject go1 = new Block()..initialize(100.0,100.0)..width = 20.0 .. height = 20.0;
    Block block = new Block()..initialize(100.0,100.0)..width = 20.0 .. height = 20.0;
    Enemy enemy = new Alien()..initialize(100.0,100.0)..width = 20.0 .. height = 20.0;
    Item item = new Oxygen()..initialize(100.0,100.0)..width = 20.0 .. height = 20.0;
    
    test("Empty Object List", () { 
      expect(goList.length, equals(0));});
    
    test("Empty Block List", () { 
      expect(blockList.length, equals(0));});
    
    test("Empty Enemy List", () { 
      expect(enemyList.length, equals(0));});
    
    test("Empty Item List", () { 
      expect(itemList.length, equals(0));});
    
    om.addObject(go1);
  
    test("Game object list has one object", () { 
      expect(om.goList.length , equals(1));});
    
    om.addBlock(block);
    
    test("Block list has one object", () { 
      expect(blockList.length, equals(1));});
    
    test("Game object list had block added", () { 
      expect(goList.length, equals(2));});
    
    om.addEnemy(enemy);
    
    test("Enemy list has one object", () { 
      expect(enemyList.length, equals(1));});
    
    test("Game object list has had enemy added", () { 
      expect(goList.length, equals(3));});
    
    om.addItem(item);
    
    test("Item list has one object", () { 
      expect(itemList.length, equals(1));});
    
    test("Game object list has had item added", () { 
      expect(goList.length, equals(4));});
    
    
    om.clear();
    
    test("Cleared Object List", () { 
      expect(goList.length, equals(0));});
    
    test("Cleared Block List", () { 
      expect(blockList.length, equals(0));});
    
    test("Cleared Enemy List", () { 
      expect(enemyList.length, equals(0));});
    
    test("Cleared Item List", () { 
      expect(itemList.length, equals(0));});
    
    
    om.addObject(go1);
    
    test("Object List has one item in it", () { 
      expect(goList.length, equals(1));});
    go1.dead = true;
    om.removeDeadObjects();
    
    test("Dead Object has been removed", () { 
      expect(goList.length, equals(0));});
    
  });
}