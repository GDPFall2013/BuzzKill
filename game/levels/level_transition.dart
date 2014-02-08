part of gdp;

class LevelTransition extends GameObject{
  
  Input input;
  SpriteSheet sprite;
  double x;
  double y;
  double width;
  double height;
  
  int spritex=0;
  int spritey=147;

  
  LevelTransition(){
    width = 150.0;
    height = 49.0;
    x = 300.0;
    y = 200.0;
    input = new Input();
    //sprite = new SpriteSheet("./content/menu.png",spritex,spritey,150,198);
  }

  
  draw(){
    if(Game.instance.state == Game.instance.stateEnumTransition){
      //sprite.drawOnPositionNormal(x-this.width/2, y-this.height/2, 150.0 , 198.0);
      
      
      normContext.fillStyle = 'black';
      normContext.fillRect(0, 0, 640, 480);
      normContext.fillStyle = 'white';
      normContext.font = "normal 30pt calibri";
      
      if(Game.instance.currentLevel == LevelManager.enumMainMenu){
            normContext.fillText('LEVEL ONE', viewportWidth/2 - 70, viewportHeight/2 - 40, 1000);
            }
      
      else if(Game.instance.currentLevel == LevelManager.enumLevelOne){
      normContext.fillText('LEVEL TWO', viewportWidth/2 - 70, viewportHeight/2 - 40, 1000);
      }
      
      else if(Game.instance.currentLevel == LevelManager.enumLevelTwo){
           normContext.fillText("LEVEL THREE \n Press Enter to continue.", viewportWidth/2 - 70, viewportHeight/2 - 40, 1000);
           }
      else if(Game.instance.currentLevel == LevelManager.enumLevelThree){
           normContext.fillText("LEVEL FOUR \n Press Enter to continue.", viewportWidth/2 - 70, viewportHeight/2 - 40, 1000);
           }
      
      normContext.font = "normal 15pt calibri";
      normContext.fillText('Press Enter to continue.', 420, 420, 1000);
   }

  }
  
  
  update(double dt){
    
   /* if(Game.instance.state == Game.instance.stateEnumPlay && input.wasPressed(KeyCode.ENTER)){
      Game.instance.state = Game.instance.stateEnumPause;
      */
      
      
      
  //down
    if(Game.instance.state == Game.instance.stateEnumTransition){

     if(input.isDown(KeyCode.ENTER)){
    ObjectManager.instance.goList.clear();
    Game.instance.currentLevel += 1;
    Game.instance.reloadLevel();

  }
  
    }
    
    
    
  }
  
}