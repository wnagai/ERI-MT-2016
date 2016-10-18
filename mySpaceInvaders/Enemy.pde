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
    dir = 2;
    step = 1;
    visible = true;
  }

  void display()
  {
    if(visible) {
      imageMode(CENTER);
      image(img, loc.x, loc.y); 
    }
  }

  void update()
  {
    loc.x += dir;
  }
  
  void invert()
  {
    if (step < 16) {
      dir *= -1;
      loc.y += img.height/4;
      step++;
    } else {
      dir = 0;
    }
  }
  
  void dead()
  {
    visible = false;
  }
  
  boolean isVisible()
  {
    return visible;
  }
}