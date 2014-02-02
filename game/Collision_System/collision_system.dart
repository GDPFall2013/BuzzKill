part of gdp;

class CollisionSystem
{
  
  static CollisionSystem instance;
  factory CollisionSystem() {
    
    if (instance == null) {
      instance = new CollisionSystem._internal();
    }
    return instance;
  }
  CollisionSystem._internal();
   
      
   PlayerCollideWithItem(Player player)
   {
    // Collision Check for player colliding with items
    for (Item item in ObjectManager.instance.itemList) 
    {
      if (checkForCollision(player, item))
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
      if (checkForCollision(player, enemy))
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
      if (checkForCollision(player, block))
      {
         player.velocity_y = 0.0;
         player.JUMPING = false;
         player.y = block.y - block.height/2 - player.height/2;      
      }
    }
   }  
     
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