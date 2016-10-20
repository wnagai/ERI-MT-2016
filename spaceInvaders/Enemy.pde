class Enemy
{
  PVector loc;
  PImage img;
  int dir, step;
  boolean visible;

  Enemy(float x, float y, String filename)
  {
    img = loadImage(filename);
    loc = new PVector(x + img.width/2, y + img.height/2);
    dir = 1;
    step = 1;
    visible = true;
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

  void dead()
  {
    this.visible = false;
  }

  boolean isDead()
  {
    return !this.visible;
  }

  boolean explode(SpaceShip ss)
  {
    if (loc.y >= ss.loc.y && 
      loc.x >= ss.loc.x - ss.img.width/2 &&
      loc.x <= ss.loc.x + ss.img.width/2) {
      this.visible = false;
    }
    return !this.visible;
  }
}