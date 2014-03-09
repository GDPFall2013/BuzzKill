part of gdp;


class LevelManager {
 
  static int enumLevelTest = 0;
  static int enumMainMenu = 0;
  static int enumLevelOne = 1;
  static int enumLevelTwo = 2;
  static int enumLevelThree = 3;
  static int enumLevelFour = 4;
  
  loadLevel(int level) {
    SoundManager.instance.stopMusic(); //TODO: This should be placed in a clear previous level function
    ObjectManager.instance.clear();
    switch(level) {  
      // enums aren't implemented yet, and switch only takes constants at the moment.
      case 0:  
        setupMainMenu();
        break;
      case 1:  
        setupLevelFour();
        break;  
      case 2:
        setupLevelTwo();
        break;
      case 3:
        setupLevelThree();
        //mainMenu menu = new mainMenu();
        //Player player = new Player();
        break;
    }
  }
}



