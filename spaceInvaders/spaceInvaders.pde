import processing.sound.*;
//import cassette.audiofiles.SoundFile;

SpaceShip ship;
ArrayList<Gun> guns;
ArrayList<Enemy> enemies;
int wallLeft, wallRight;
SoundFile shoot;

void setup()
{
  fullScreen();
  //size(800,600);

  shoot = new SoundFile(this, "shoot.mp3");

  ship = new SpaceShip();
  guns = new ArrayList<Gun>();
  enemies = new ArrayList<Enemy>();

  wallLeft = int(width*0.25);
  wallRight = int(width*0.75);

  for (int i = 0; i < (wallRight-wallLeft)/96; i++)
    enemies.add(new Enemy(i*96 + wallLeft, 16, "s-l64-17.jpg"));
  //  for (int i = 0; i < 6; i++)
  //    enemies.add(new Enemy(i*96 + wallLeft + 32, 80, "s-l64-15.jpg"));
  //  for (int i = 0; i < 6; i++)
  //    enemies.add(new Enemy(i*96 + wallLeft, 144, "s-l64-24.jpg"));
  frameRate(10);
}

void mousePressed()
{
  if (mouseX > wallRight)
    ship.turnRight();
  else if (mouseX < wallLeft)
    ship.turnLeft();
  else {
    guns.add(new Gun(ship.loc.x - 4, ship.loc.y-2));
    shoot.play();
  }
}

void draw()
{
  background(0);
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
        enemy.visible = false;
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