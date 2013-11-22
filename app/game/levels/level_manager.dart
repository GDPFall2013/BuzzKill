part of gdp;


class LevelManager {
 
  static int enumLevelTest = 0;
  static int enumLevelOne = 1;
  
  loadLevel(int level) {
    
    switch(level) {  
      // enums aren't implemented yet, and switch only takes constants at the moment.
      case 0: 
        setupLevelTest();
        break;
      case 1: 
       setupLevelOne();
        break;  
    }
  }
}