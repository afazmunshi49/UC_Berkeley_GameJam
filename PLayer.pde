class Player
{
  PImage image;
  int score;
  
  float x;
  float y;
  float speed = 200;
  float size = 64;
  
  public Player(float x, float y) 
  {
    this.x = x;
    this.y = y;
    
    image = loadImage("Assets/run.png");

  }
  
  void draw()
  {
    
    image(image, x, y, size, size);
    
  }
  
  void update(float dt, ArrayList<Surroundings> sr)
  {
    if(isKeyDown('w'))
    {
      if(y >  size)
      {
        
       y -= speed * dt;
      }
      
    }
    if(isKeyDown('s'))
    {
      if (y < height - size)
      {
      
        y += speed*dt;
        
      }
        
    }
    
    if(isKeyDown('a'))
    {
      if(x > size)
      {
      
         x -= speed * dt;
        
      }
       
    }
    
    if(isKeyDown('d'))
    {
      if(x < width - size)
      {
      
         x += speed * dt;
      }
        
    } // if
    
  } // update
  
  Boolean isCollidedApple(ArrayList<Apple> al)
  {

   // ArrayList<Apple> remove = new ArrayList();
    
    for(int i= 0; i< al.size(); i++)
    {
      
      Apple apple = al.get(i);
      
      float distance = sqrt( sq(apple.x - this.x) + sq(apple.y - this.y) );
    
      float threshold =   apple.size/2 + this.size/2;
    
      Boolean collision = (distance <= threshold);
      
      if(collision)
      {
        al.remove(apple);
        score+=25;
        
        //if(apple.poisioned)
        //{
            score-=15;
            speed -= 10;
        //}
          
        
        return true;
      
      } // if
      
    } // for
    return false;
  }
  
  //Boolean isCollidedSurroundings(ArrayList<Surroundings> sr)
  //{
  
  //  for(int i = 0; i< sr.size(); i++)
  //  {
      
  //      Surroundings obj = sr.get(i);
      
  //      float distance = sqrt( sq(obj.x - this.x) + sq(obj.y - this.y) );
    
  //      float threshold =   obj.size/2 + this.size/2;
      
  //      if(distance <= threshold)
  //      {
  //        return  true;
  //      }
      
  //  } // for
    
  //  return false;
    
  //}
  
  Boolean isNextinxDir(ArrayList<Surroundings> sr){
      
    for(int i = 0; i< sr.size(); i++)
    {
        Surroundings obj = sr.get(i);
        if(obj.x == (this.x + 10)){
          return true;
        }
    }
    return false;
  }
  
  Boolean isNextinyDir(ArrayList<Surroundings> sr){
      
    for(int i = 0; i< sr.size(); i++)
    {
        Surroundings obj = sr.get(i);
        if(obj.y == (this.y + 10)){
          return true;
        }
    }
    return false;
  }

  
} // class
