class SpaceShip
{
  PVector loc;
  PImage img;
  int dir;

  SpaceShip()
  {
    img = loadImage("s-l64-2.jpg");
    loc = new PVector((width - img.width)/2, height - img.height);
    dir = 0;
  }

  void display()
  {
    imageMode(CENTER);
    image(img, loc.x, loc.y);
  }

  void update(int wl, int wr)
  {
    loc.x += dir;
    if (loc.x < wl + img.width/2 + 16|| loc.x > wr - img.width/2 - 16)
      dir = 0;
  }

  void turnRight()
  {
    if (dir < 0)
      dir *= -1;
    if (dir == 0)
      dir = 4;
  }

  void turnLeft()
  {
    if (dir > 0)
      dir *= -1;
    if (dir == 0)
      dir = -4;
  }
}