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
  
  /*
   * Adds an object to the master list of objects
   */
  void addObject(GameObject go) {
    goList.add(go);
  }
}