class Gun
{
  PVector loc;
  int dir;
  
  Gun(float x, float y)
  {
    loc = new PVector(x, y);
    dir = 8;
  }
  
  void update()
  {
    loc.y -= dir;
  }
  
  void display()
  {
    noStroke();
    fill(255);
    rect(loc.x, loc.y, 8, 2);
  }
}