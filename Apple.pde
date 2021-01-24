class Apple
{

  PImage appleImage;
  
  float x;
  float y;
  Boolean poisioned;
  
  int size = 32;
  
  int numApples = 10;
  
  public Apple(float x, float y, Boolean poisioned)
  {
    this.x = x;
    this.y = y;
    this.poisioned = poisioned;
    
    
    appleImage = loadImage("Assets/apple.png");
    
  } // constructor
  
  
  void draw()
  {
    image(appleImage, x, y, size, size);
  }
  
  //void isCollieded(Player player)
  //{
    
  //  float distance = sqrt( sq(player.x - this.x) + sq(player.y - this.y) );
    
  //  float threshold =   player.size/2 + this.size/2;
  
  //  for(int i = 0; i< )
  //  {
    
  //  }
  
  //} // isCollided
  
}
