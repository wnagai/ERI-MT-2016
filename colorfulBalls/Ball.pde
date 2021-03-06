/*
  Ball: one colorful ball
  - Ball()            // constructor
  - draw()            // draw the ball
  - update()          // calculate next position of ball
  - checkCollision()  // test if ball is coliding in screen frontiers
*/
class Ball {
  int x, y, 
    dirx, diry, 
    size; 
  color c;

  Ball() {
    if (width > height)
      this.size = height/16;
    else
      this.size = width/16;

    this.x = int(random(width/2) + width*0.25);
    this.y = int(random(height/2) + height*0.25);

    this.dirx = this.diry = int(random(10)) + 1;
    this.c = color(random(255), random(255), random(255));
  }

  void draw() {
    fill(this.c);
    ellipse(this.x, this.y, this.size, this.size);
  }

  void update() {
    this.x += this.dirx; 
    this.y += this.diry;
  }

  void checkCollision() {
    if (this.x < size/2 || this.x > width-size/2) 
      this.dirx *= -1;
    if (this.y < size/2 || this.y > height-size/2) 
      this.diry *= -1;
  }
}