class SpaceShip
{
  PVector loc;
  PImage img;
  int dir;
  boolean visible;

  SpaceShip()
  {
    this.img = loadImage("s-l64-2.jpg");
    this.loc = new PVector((width - img.width)/2, height - img.height);
    this.dir = 0;
    this.visible = true;
  }

  void display()
  {
    imageMode(CENTER);
    image(this.img, loc.x, loc.y);
  }

  void update(int wl, int wr)
  {
    this.loc.x += this.dir;
    if (this.loc.x < wl + this.img.width/2 + 16 || 
      this.loc.x > wr - this.img.width/2 - 16)
      this.dir = 0;
  }

  void turnRight()
  {
    if (this.dir < 0)
      this.dir *= -1;
    if (this.dir == 0)
      this.dir = 1;
  }

  void turnLeft()
  {
    if (this.dir > 0)
      this.dir *= -1;
    if (this.dir == 0)
      this.dir = -1;
  }
}