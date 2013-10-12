part of boiler_plate;

/**
 *  The Game class holds the root of the game.  It is started by Main
 *  and controls all other parts of the application. 
 */
class Game{
Input input;
Game() {
    input = new Input();
}

int x = 20;
int y = 30;

/**
 *  Update is called once per game Loop
 */
void update() {
  
  if (input.isDown(KeyCode.UP)){
   y -= 1;
  }
  if (input.isDown(KeyCode.DOWN)){
   y += 1;
  }
  if (input.isDown(KeyCode.RIGHT)){
   x += 1;
  }
  if (input.isDown(KeyCode.LEFT)){
   x -= 1;
  }
}

/**
 *  Draw is called once per Render? I believe.  Its called
 *  By the Game Loop
 */
void draw() {
  context.fillStyle = 'gray';
  context.fillRect(0, 0, 640, 480);
  
  context.fillStyle = 'black';
  context.font = "normal 20pt san-serif";
  context.fillText(" Boiler Plate ", x, y, 100);
}

}