part of gdp;

class CollisionSystem extends GameObject
{
  
  static CollisionSystem instance;
  factory CollisionSystem() {
    
    if (instance == null) {
      instance = new CollisionSystem._internal();
    }
    return instance;
  }
  CollisionSystem._internal();
   
   ObjectManager check_collision = new ObjectManager();
   
   
     PlayerCollideWithItem(Player player)
     {
      // Collision Check for player colliding with items
      for (Item item in ObjectManager.instance.itemList) 
      {
        if (check_collision.checkForCollision(player, item))
        {
          item.collect();   
        }
      }
     }
     
     PlayerCollideWithEnemy(Player player)
     {
       // Collision Check for player colliding with enemies
      for (Enemy enemy in ObjectManager.instance.enemyList) 
      {
        if (check_collision.checkForCollision(player, enemy))
        {
          player.injureBuzz (enemy.injure());  
          
        }
      }
     }
     
     PlayerCollideWithBlock(Player player)
     {
      //Collision Check for player colliding with blocks
      for (Block block in ObjectManager.instance.blockList) 
      {
        if (check_collision.checkForCollision(player, block))
        {
           player.velocity_y = 0.0;
           player.JUMPING = false;
           player.y = 350.0;      
        }
      }
     }  
}

















  
