Ball myBall[]; 
int amount;

void setup() 
{
  fullScreen();
  amount = int(random(100)) + 1; 
  myBall = new Ball[amount];
  for (int i = 0; i < amount; i++)
    myBall[i] = new Ball();
}

void draw() 
{
  background(0);
  fill(255);
  for (int i = 0; i < amount; i++) {
    myBall[i].update();
    myBall[i].checkCollision();
    myBall[i].draw();
  }
}