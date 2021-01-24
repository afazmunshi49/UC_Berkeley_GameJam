class Monster
{
  Player player;
  
  PImage monsterImage;

  float x;
  float y;
  
  final int SPEED = 80;
  
  float size = 100;
  
  float angle;
  float speed = SPEED;
  
  public Monster(float x, float y)
  {
    this.x = x;
    this.y = y;
    
    monsterImage = loadImage("Assets/monster.png");
    
  } // constructor
  
  Boolean isCollided(Player player)
  {
    
    float distance = sqrt( sq(player.x - this.x) + sq(player.y - this.y) );
    
    float threshold =   player.size/2 + this.size/2;
    
    Boolean collision = (distance <= threshold);    
    
   return collision; 
  } // isCollided
  
  void update(float dt, float playerX, float playerY)
  {
    makeMonsterMove(playerX, playerY, dt);
  }
  
  void draw()
  {
    speed = SPEED;
    image(monsterImage, x, y, size, size);
  }
 
  // Monster will follow the player.
  void makeMonsterMove(float playerX, float playerY, float dt)
  {
 
    PVector monsterPosition = new PVector(this.x, this.y);
    PVector playerPosition = new PVector(playerX, playerY);
        
    float angle = playerPosition.sub(monsterPosition).heading();
    
    this.x += cos(angle) * speed * dt;
    this.y += sin(angle) * speed * dt;
        
  } // function
  
}
