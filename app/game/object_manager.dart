part of gdp;

class ObjectManager {
  static ObjectManager instance;
  factory ObjectManager() {
    
    if (instance == null) {
      instance = new ObjectManager._internal();
    }
    return instance;
  }
  ObjectManager._internal();
  
  List<GameObject> goList = new List<GameObject>();
  List<GameObject> blockList = new List<Block>();
  List<Enemy> enemyList = new List<Enemy>();
  List<Item> itemList = new List<Item>();
  
  /*
   * Adds an object to the master list of objects
   */
  void addObject(GameObject go) {
    goList.add(go);
  }
  
  void removeDeadObjects() {
    for (int i = 0; i < goList.length; i++){
      GameObject go = goList[i];
      if (go.dead){
        goList.remove(go);
        itemList.remove(go);
        enemyList.remove(go);
        blockList.remove(go);
        i--;
      }
    }
  }
  
  //TODO this is not currently used
// given two objects, check for a collision between them
  bool checkForCollision(GameObject a, GameObject b){
    bool collided = false;
  
    assert(a.height > 0 && a.width > 0 &&
        b.height > 0 && b.width > 0);
    
    if ((b.x - b.width/2 < (a.x + a.width/2) && 
        (b.x + b.width/2) > a.x - a.width/2) &&
        (b.y - b.height/2< (a.y + a.height/2) && 
        (b.y + b.height/2) > a.y - a.height/2)) {
      
      collided = true;
    }
    return collided;
  }
}