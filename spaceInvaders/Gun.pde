class Gun
{
  PVector loc;
  int dir;
  boolean visible;
  
  Gun(float x, float y)
  {
    loc = new PVector(x, y);
    dir = 2;
    visible = true;
  }
  
  void update()
  {
    loc.y -= dir;
  }
  
  void display()
  {
    noStroke();
    rectMode(CENTER);
    fill(255);
    rect(loc.x + 4, loc.y, 6, 6);
  }
  
  void explode()
  {
    this.visible = false;
  }
  
  boolean isExplode()
  {
    return !this.visible;
  }
}