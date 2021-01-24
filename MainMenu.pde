class MainMenu {

  int textSizeTitle = 150;
  int textSizePlay = 80;
  int posXCenter = width/2;
  int posYCenter = height/2;
  Boolean gameStart;

  public MainMenu() {
    gameStart = false;
  }
  
  void draw(){
    clear();
    textAlign(CENTER, TOP);
    textSize(textSizeTitle);
    text("Apple Monster", posXCenter, 50);
    
    float clickWidth = textWidth("Play Now");
    float clickHeight = textSizePlay + 1;
    float clickX = posXCenter - clickWidth/2;
    float clickY = posYCenter - clickHeight/2 + textDescent();
    
    if(((mouseX > clickX && mouseX < (clickX + clickWidth)) && (mouseY > clickY && mouseY < (clickY + clickHeight))) && mousePressed){
      if(mouseButton == LEFT){
        gameStart = true;
      }
    }
    
    textSize(textSizePlay);
    text("Play Now", posXCenter, posYCenter);
  }
}
