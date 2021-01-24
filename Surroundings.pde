class Surroundings{
  float x;
  float y;
  
  float size;
  PImage fileName;
  
  
  
  // ArrayList<Surroundings> sr = new ArrayList();
  
  public Surroundings(String fileN, float x1, float y1, float sizeValue, SurroundingSystem srdSys){
    fileName = loadImage(fileN);
    x = x1;
    y = y1;
    size = sizeValue;
    srdSys.addItem(this);
  }
  
  void draw()
  {
    image(fileName, x, y, size, size);
  }

}
