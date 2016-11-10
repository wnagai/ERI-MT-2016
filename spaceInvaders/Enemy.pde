class Enemy
{
  PVector loc;
  PImage img;
  int dir, step, points;
  boolean visible;

  Enemy(float x, float y, String filename, int points)
  {
    this.img  = loadImage(filename);
    this.loc  = new PVector(x + img.width/2, y + img.height/2);
    this.dir  = 1;
    this.step = 1;
    this.points = points;
    this.visible = true;
  }

  void display()
  {
    if (this.visible) {
      imageMode(CENTER);
      image(this.img, loc.x, loc.y);
    }
  }

  void update()
  {
    this.loc.x += dir;
  }

  void invert()
  {
    if (this.step < 24) {
      this.dir *= -1;
      this.loc.y += this.img.height/4;
      this.step++;
    } else {
      this.dir = 0;
    }
  }

  int dead()
  {
    this.visible = false;
    
    return points;
  }

  boolean isDead()
  {
    return !this.visible;
  }

  boolean explode(SpaceShip ss)
  {
    if (this.loc.y >= ss.loc.y && 
      this.loc.x >= ss.loc.x - ss.img.width/2 &&
      this.loc.x <= ss.loc.x + ss.img.width/2) {
      this.visible = false;
    }
    return !this.visible;
  }
}