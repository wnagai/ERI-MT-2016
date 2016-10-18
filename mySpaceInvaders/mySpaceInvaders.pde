import processing.sound.*;
//import cassette.audiofiles.SoundFile;

SpaceShip ship;
ArrayList<Gun> guns;
ArrayList<Enemy> enemies;
int wallLeft, wallRight;
//SoundFile explosion, invaderKilled, shoot, ufo;
SoundFile shoot;

void setup()
{
  fullScreen();
  //size(800,600);

  //explosion = new SoundFile(this, "explosion.wav");
  //invaderKilled = new SoundFile(this, "invaderkilled.wav");
  shoot = new SoundFile(this, "shoot.mp3");
  //ufo = new SoundFile(this, "ufo_lowpitch.wav");

  ship = new SpaceShip();
  guns = new ArrayList<Gun>();
  enemies = new ArrayList<Enemy>();

  wallLeft = int(width*0.25);
  wallRight = int(width*0.75);

  for (int i = 0; i < 6; i++)
    enemies.add(new Enemy(i*96 + wallLeft, 16, "s-l64-17.jpg"));
  for (int i = 0; i < 6; i++)
    enemies.add(new Enemy(i*96 + wallLeft + 32, 80, "s-l64-15.jpg"));
  for (int i = 0; i < 6; i++)
    enemies.add(new Enemy(i*96 + wallLeft, 144, "s-l64-24.jpg"));
}

void draw()
{
  background(0);
  if (mousePressed)
  {
    if (mouseX > wallRight)
      ship.turnRight();
    else if (mouseX < wallLeft)
      ship.turnLeft();
    else {
      guns.add(new Gun(ship.loc.x - 6, ship.loc.y-8));
      shoot.play();
    }
  }
  for (int i = 0; i < enemies.size(); i++) {
    Enemy enemy = enemies.get(i);
    if (enemy.loc.x > wallRight - enemy.img.width/2 ||
      enemy.loc.x < wallLeft + enemy.img.width/2) {
      for (int j = 0; j < enemies.size(); j++) {
        Enemy e = enemies.get(j);
        e.invert();
      }
    }
    for (int j = 0; j < guns.size(); j++) {
      Gun oneGun = guns.get(j);
      oneGun.update();
      oneGun.display();
      if (oneGun.loc.y <= enemy.loc.y)
      {
      }
    }
    if (enemy.isVisible()) {
      enemy.update();
      enemy.display();
    }
  } 
  ship.update(wallLeft, wallRight);
  ship.display();
}