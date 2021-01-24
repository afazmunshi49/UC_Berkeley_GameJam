class SurroundingSystem
{

  ArrayList<Surroundings> sr;
  
  public SurroundingSystem()
  {
    sr = new ArrayList();
  }
  
  Boolean addItem(Surroundings srd)
  {
    
    if(srd != null)
    {
      sr.add(srd);
      return true;
    }
    return false;
  } // add
  
  ArrayList<Surroundings> getArrayList()
  {
    return this.sr;
  }
  
}
