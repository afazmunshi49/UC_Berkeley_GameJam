class AppleSystem
{

  ArrayList<Apple> apples;
  
  public AppleSystem(){
  
  }
  
  
  ArrayList<Apple> getAppleRow(int numApples, int yPos)
  {
  
    ArrayList<Apple> al = new ArrayList();
    
    float rand = random(0, numApples);
    
    for(int i = 0; i< rand; i++)
    {
      al.add(new Apple(random(32, width - 32), yPos, null));
    } // for
  
    return al;
  
  }
  
  
  


}
  
