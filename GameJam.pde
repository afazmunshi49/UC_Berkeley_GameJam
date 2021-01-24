Game game;

Surroundings house1;
Surroundings house2;
Surroundings house3;
Surroundings house4;
Surroundings tree1;
Surroundings tree2;
Surroundings tree3;
Surroundings tree4;
Surroundings tree5;
Surroundings tree6;
Surroundings tree7;
Surroundings tree8;
Surroundings tree9;
Surroundings tree10;
Surroundings pond1;
Surroundings pond2;

PImage hut;
PImage gameBackGround;
PImage newGameBackGround;

SurroundingSystem srdSys;
Boolean isInHut = false;
Boolean gameOver;
int appleCount = 0;

HashMap <Integer, Boolean> inputMap;
float previousFrameTime;

void setup()
{
  size(1080, 720);
  //fullScreen();
  game = new Game();
  srdSys = new SurroundingSystem();

  inputMap = new HashMap();

  previousFrameTime = millis();


  hut = loadImage("Assets/hut.png");

  gameBackGround = loadImage("Assets/GameBackGround_V2.jpg");
  newGameBackGround = loadImage("Assets/puzzleImage1.jpg"); 

  house1 = new Surroundings("Assets/house.png", width/4, height/4, 128, srdSys);
  house2 = new Surroundings("Assets/house.png", width - width/4 - 128, height/4, 128, srdSys);
  house3 = new Surroundings("Assets/house2.png", width/4, 3 * height/4 - 128, 128, srdSys);
  house4 = new Surroundings("Assets/house2.png", width - width/4 - 128, 3 * height/4 - 128, 128, srdSys);
  tree1 = new Surroundings("Assets/appleTree.png", 0, height/4, 64, srdSys);
  tree2 = new Surroundings("Assets/appleTree.png", 0, 3*height/4, 64, srdSys);
  tree3 = new Surroundings("Assets/appleTree.png", width/3 - 128, height - 64, 64, srdSys);
  tree4 = new Surroundings("Assets/appleTree.png", 2*width/3 - 128, height - 64, 64, srdSys);
  tree5 = new Surroundings("Assets/appleTree.png", width - 64 - 128, height - 64, 64, srdSys);
  tree6 = new Surroundings("Assets/appleTree.png", width - 64, height/4, 64, srdSys);
  tree7 = new Surroundings("Assets/appleTree.png", width - 64, 3*height/4, 64, srdSys);
  tree8 = new Surroundings("Assets/appleTree.png", width/3 - 128, 0, 64, srdSys);
  tree9 = new Surroundings("Assets/appleTree.png", 2*width/3 - 128, 0, 64, srdSys);
  tree10 = new Surroundings("Assets/appleTree.png", width - 64 - 128,0, 64, srdSys);
  pond1 = new Surroundings("Assets/pond.png", width/2 - 128, height/3 - 128, 128, srdSys);
  //pond2 = new Surroundings("Assets/pond.png", x1, y1, 64);
}

void draw()
{

//println("X pos is->" +mouseX);
//println("Y pos is->" +mouseY);
  float currentFrameTime = millis();

  float deltaTime = currentFrameTime - previousFrameTime;

  deltaTime/= 1000.0;

  previousFrameTime = currentFrameTime;

  //background(255, 0, 0);
  // circle(width/2, height/2, 64);

  game.update(deltaTime);
  clear();
  background(#7fff00);
  if(isInHut)
  {
    image(newGameBackGround, 0, 0, 1080, 720);
    
    if(mousePressed)
    {
      if((mouseX >540 && mouseY > 360 && mouseX< 590 && mouseY < 420) && (appleCount >=9) )
      {
        isInHut = false;
        println("You found the object!");
        gameOver = true;
      }
    }
    
  }
  else
  {
    background(#7fff00);
  image(gameBackGround, 0, 0, 1080, 720);
  image(hut, 0, 0, 64, 64);
    drawSurroundings();
  }
    game.draw();
}

void drawSurroundings()
{  
  house1.draw();
  house2.draw();
  house3.draw();
  house4.draw();
  pond1.draw();
  tree1.draw();
  tree2.draw();
  tree3.draw();
  tree4.draw();
  tree5.draw();
  tree6.draw();
  tree7.draw();
  tree8.draw();
  tree9.draw();
  tree10.draw();

}

Boolean isKeyDown(char key)
{
  char pressed = Character.toLowerCase(key);

  if (inputMap.containsKey((int)pressed))
  {
    return inputMap.get((int)pressed);
  }

  return false;
} // isKeyDown


void keyPressed() 
{
  char pressed = Character.toLowerCase(key);
  inputMap.put((int)pressed, true);
} 

void keyReleased() 
{
  char released = Character.toLowerCase(key);
  inputMap.put((int)released, false);
}
