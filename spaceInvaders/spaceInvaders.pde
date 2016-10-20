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

  shoot = new SoundFile(this, "shoot.mp3");

  ship = new SpaceShip();
  guns = new ArrayList<Gun>();
  enemies = new ArrayList<Enemy>();

  wallLeft = int(width*0.25);
  wallRight = int(width*0.75);

  for (int i = 0; i < (wallRight-wallLeft)/96; i++)
    enemies.add(new Enemy(i*96 + wallLeft, 16, "s-l64-17.jpg"));
  for (int i = 0; i < 6; i++)
    enemies.add(new Enemy(i*96 + wallLeft + 32, 80, "s-l64-15.jpg"));
  for (int i = 0; i < 6; i++)
    enemies.add(new Enemy(i*96 + wallLeft, 144, "s-l64-24.jpg"));
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

  for (Enemy enemy : enemies)
  {
    if (enemy.loc.x > wallRight - enemy.img.width/2 ||
      enemy.loc.x < wallLeft + enemy.img.width/2) {
      for (int j = 0; j < enemies.size(); j++) {
        Enemy e = enemies.get(j);
        e.invert();
      }
    }
    enemy.update();
    if (enemy.isVisible()) {
      enemy.display();
    }
    for (Gun oneGun : guns) {
      oneGun.update();
      if (oneGun.isVisible())
        oneGun.display();

      if (oneGun.loc.y <= enemy.loc.y && 
        oneGun.loc.x >= enemy.loc.x && 
        oneGun.loc.x <= enemy.loc.x) {
        enemy.dead();
        oneGun.explode();
      }
    }
  }
  for (Enemy e : enemies) {
    if (!ship.explode(e) && e.isVisible()) {
      ship.update(wallLeft, wallRight);
      ship.display();
    }
  }
}