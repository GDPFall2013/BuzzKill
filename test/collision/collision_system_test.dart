part of gdp_test;

collisionSystemTest() {
  group('Collision: ', () {
    CollisionSystem cm = new CollisionSystem();
    
    GameObject go1 = new Block()..initialize(100.0,100.0)..width = 20.0 .. height = 20.0;
    GameObject go2 = new Block() .. initialize(80.0, 80.0)..width = 20.0 ..height = 20.0;
    
    test("Check for Collision Method, does not collide", () { 
      expect(cm.checkForCollision(go1, go2), isFalse);});
    
    GameObject go3 = new Block() .. initialize(90.0, 90.0)..width = 20.0 ..height = 20.0;
    
    test("Check for Collision Method, Collide upper left", () { 
      expect(cm.checkForCollision(go1, go3), isTrue);});
    
    GameObject go4 = new Block() .. initialize(90.0, 110.0)..width = 20.0 ..height = 20.0;
    
    test("Check for Collision Method, Collide bottom left", () { 
      expect(cm.checkForCollision(go1, go4), isTrue);});
    
    GameObject go5 = new Block() .. initialize(110.0, 110.0)..width = 20.0 ..height = 20.0;
    
    test("Check for Collision Method, Collide bottom right", () { 
      expect(cm.checkForCollision(go1, go5), isTrue);});
    
    GameObject go6 = new Block() .. initialize(110.0, 90.0)..width = 20.0 ..height = 20.0;
    
    test("Check for Collision Method, Collide upper right", () { 
      expect(cm.checkForCollision(go1, go6), isTrue);});
    
    
    // test collide with item
    
    // test player collide with enemy
    
    // test player collide with block
  });
}