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
  for (int i = 0; i < (wallRight-wallLeft)/96; i++)
    enemies.add(new Enemy(i*96 + wallLeft + 16, 80, "s-l64-15.jpg"));
  for (int i = 0; i < (wallRight-wallLeft)/96; i++)
    enemies.add(new Enemy(i*96 + wallLeft + 32, 144, "s-l64-24.jpg"));
}

void mousePressed()
{
  if (mouseX > wallRight)
    ship.turnRight();
  else if (mouseX < wallLeft)
    ship.turnLeft();
  else {
    guns.add(new Gun(ship.loc.x - 4, ship.loc.y));
    shoot.play();
  }
}

void draw()
{
  background(0);

  // for each enemy (alien)
  for (Enemy enemy : enemies)
  {
    // if alien position (x, y) is near of left or right wall
    // invert the right movement to left movement
    if (enemy.loc.x > wallRight - enemy.img.width/2 ||
      enemy.loc.x < wallLeft + enemy.img.width/2) {
      for (Enemy e : enemies)
        e.invert();
    }
    // for each gun update it location
    for (Gun oneGun : guns) {
      oneGun.update();
      // if gun is not explode, display it
      if (!oneGun.isExplode())
        oneGun.display();
      // if gun shoot any alien (x, y), enemy is dead and explode
      if (oneGun.loc.y <= enemy.loc.y && 
        oneGun.loc.x >= enemy.loc.x && 
        oneGun.loc.x <= enemy.loc.x) {
        // explode enemy
        enemy.dead();
        // explode gun
        oneGun.explode();
      }
    }
    // update aliens
    enemy.update();
    // if enemy is alive
    if (!enemy.isDead())
      enemy.display();
  }
  // test each enemy if takeout the spaceship, exploding it
  for (Enemy e : enemies) {
    // if enemy not explode the ship and enemy is not dead
    if (!e.explode(ship) && !e.isDead()) {
      // update the spaceship location
      ship.update(wallLeft, wallRight);
      // show the spaceship
      ship.display();
    }
  }
}