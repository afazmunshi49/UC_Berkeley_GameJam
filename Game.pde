class Game
{
  Player player;
  Apple apple;
  Monster monster;
  AppleSystem appleSystem;
  MainMenu menu;

  Score score;
  final int scoreTextSize = 32;


  ArrayList<Apple> apples;

  float x = width/2;
  float y = height/2;

  public Game() 
  {

    player = new Player(width/2, height/2);
    //apple = new Apple(width/2, height/2);
    score = new Score(scoreTextSize, player);
    
    menu = new MainMenu();



    monster = new Monster(height - 50, width/2);

    apples = generateApples(32, 10);

    gameOver = false;
  } // constructor


  ArrayList<Apple> generateApples(int size, int numApples)
  {

    ArrayList<Apple> al = new ArrayList();

    for (int i = 1; i <= numApples; i++)
    {
      float yPosition = (i-1) * height/10 + size; // y position remains the equvidistant

      float xPosition = random(32, width - 32); // horizontally it will change

      float rand = random(0, 1);

      Apple apple;

      if (rand <= 0.2)
        apple = new Apple(xPosition, yPosition, true);
      else
        apple = new Apple(xPosition, yPosition, false);

      al.add(apple);
    } // for

    return al;
  }





  void update(float dt)
  {
     if(player.x <= 64 && player.y <= 64)
    {
      isInHut = true;
      player.update(dt, srdSys.getArrayList());
    }
    
    if(isKeyDown('r'))
    {
      isInHut = false;
    }

    player.update(dt, srdSys.getArrayList());

    if (player.isCollidedApple(apples)) {

      //if (appleCount >=9)
      //  gameOver = true;

      appleCount++; 
      print(appleCount);
    }

    monster.update(dt, player.x, player.y);
  }

  void draw()
  {
    if (menu.gameStart) {
      if (gameOver)
      {
        clear();
        textAlign(CENTER, CENTER);
        textSize(165);
        text("GAME OVER!", width/2, height/2-70);
        textSize(100);
        text("\nYour Score:" + player.score, width/2, height/2+165/2-70);

        return;
      } // if gameOver
      player.draw();


//clear();
//  //background(#7fff00);
//  game.update(deltaTime);

//  if (game.gameStart) {
//    if (game.gameOver) {
//      gameOverTimer -= deltaTime;
//      if (gameOverTimer <= 0) {
//        gameOverTimer = gameOverTime;
//        game.gameStart = false;
//      }
//    }
//    else {
//      game.update(deltaTime);

//      image(gameBackGround, 0, 0, 1080, 720);
//      image(hut, 0, 0, 64, 64);

//      drawSurroundings();
//    }


      // Draw apples of the screen
      for (int i = 0; i< apples.size(); i++)
      {
        Apple apple = apples.get(i);

        apple.draw();
      } // for

      if (monster.isCollided(player))
      {
        gameOver = true;
        print("The monster has caught you!");
      }

      monster.draw();

      score = new Score(scoreTextSize, player);
    } // if gameStart
    
    else{
      menu.draw();
      monster.speed -= monster.speed;
      
    } // if not gameStart

    //circle(player.x, player.y, 64);
  }
} // class
