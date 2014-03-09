part of gdp;

class Globals{
  static double spikeDamage;
  static double enemyDamage;
  
  static double oxygenLossRate; // this is milliseconds per tick, increase to slow
  
  static double gameSpeed;
  static double jumpVelocity = 1.0;
  
  
  
  static void setEasyDifficulty() {
    spikeDamage = 0.5;
    enemyDamage = 0.5;
    
    oxygenLossRate = 1000.0;
    gameSpeed = 1.0;
  }
  
  static void setNormalDifficulty() {
    spikeDamage = 0.75;
    enemyDamage = 0.75;
    
    oxygenLossRate = 400.0;
    gameSpeed = 1.0;
  }
  
  // This is the difficulty the Beta test was at
  static void setHardDifficulty() {
    spikeDamage = 1.0;
    enemyDamage = 1.0;
    
    oxygenLossRate = 250.0;
    gameSpeed = 2.0;
  }
  
  static void setInsaneDifficulty() {
    spikeDamage = 1.5;
    enemyDamage = 2.0;
    
    oxygenLossRate = 250.0;
    gameSpeed = 1.5;
    jumpVelocity = 1.02;
  }
}