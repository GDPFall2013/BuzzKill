part of gdp;

/**
 * An enemy is any object that can harm the Player
*/
abstract class Projectile extends Enemy {
  double horizontalVelocity = 0.0;
  double verticalVelocity = 0.0;
  double injureValue;
  
  SpriteSheet sprite;
  
  double imgOffsetX;
  double imgOffsetY;
 
  update (double dt) 
  {
    x = x + horizontalVelocity * dt; 
    y = y + verticalVelocity * dt;
    
    sprite.update(dt);  
  } 
  
  draw()
  {
     sprite.drawOnPosition(x-width/2 - imgOffsetX, y-height/2 + imgOffsetY, width , height);
  }
  
  double injure() 
  {
    // It'd be nice if this also removed the projectile
    return injureValue * Globals.enemyDamage;
  }
  
}