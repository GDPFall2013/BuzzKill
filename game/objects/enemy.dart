part of gdp;

/**
 * An enemy is any object that can harm the Player
*/
abstract class Enemy extends GameObject {
  bool triggerFall;
  
  double injure() {}
 
}