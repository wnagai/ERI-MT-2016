/*
  colorfulBalls
  - show colorful balls in random position (x, y) in screen
*/
Ball []balls;   // array of many balls 
int amount;      // how many balls ?

void setup() 
{
  fullScreen();  // full screen 
  
  amount = int(random(10)) + 1;  // random number of balls
  balls = new Ball[amount];     // array of amount balls
  for (int i = 0; i < amount; i++)  // instance each ball in balls
    balls[i] = new Ball();
}

void draw() 
{
  background(0);  // background color is black
  
  // for each ball in balls, draw ball with any color
  for(Ball ball : balls) {
    ball.update();
    ball.checkCollision();
    ball.draw();
  }
}  