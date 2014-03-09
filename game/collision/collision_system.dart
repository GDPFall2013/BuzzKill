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
   { bool boss = false;
       // Collision Check for player colliding with enemies
      for (Enemy enemy in ObjectManager.instance.enemyList) 
        {
          if (checkForCollision(player, enemy))
          {
            if(enemy.TYPE == "BOSS"){
              boss = true;
            }
            player.injureBuzz (enemy.injure(),boss);  
            
          }
      }
   }
     
   Block PlayerCollideWithBlock(Player player)
   {
     Block movingBlock;
     bool onblock = false;
      //Collision Check for player colliding with blocks
      for (Block block in ObjectManager.instance.blockList) 
      {
          if (checkForCollision(player, block))
          {
             if (player.velocity_y > 0) { // This means he is hitting the block from below
               player.y = block.y + block.height/2 + player.height/2; 
             } 
             else {  // He is falling
               //if moving block, return block
               if(block.moving){
                movingBlock = block;   //to return
                }
               //if player on spring
               if(block.spring){
                 Spring spring = block;
                 if(!spring.once){
                 spring.setOnSpring(true);
                 }
               }
               onblock = true;
               player.y = block.y - block.height/2 - player.height/2;     
             }
             
           player.velocity_y = 0.0;
          }
      }
      
      if (onblock) {
        player.JUMPING = false;
        player.SPRING_INAIR = false;
        }

       else {
        player.JUMPING = true;
      }
      return movingBlock;
   }
   

   
   
   
   
   PlayerCollideWithTrigger(Player player){
     bool onTrigger = false;
     for (Trigger trigger in ObjectManager.instance.triggerList){
       if (checkForCollision(player, trigger)){
         trigger.collapse();
         if(trigger.y == trigger.originalY){
         trigger.y += 20;
         }
      }
       
       else if(trigger.y != trigger.originalY){
         trigger.y -=20;
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