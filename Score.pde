class Score{
  int currentScore = 0;
  int textSize;
  
  public Score(int size, Player player){
    textSize = size;
    
    textAlign(RIGHT, TOP);
    textSize(textSize);
    text("Score:" + player.score,width-textSize/2,0);
  }
}
