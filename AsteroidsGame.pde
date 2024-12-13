ArrayList<Bullet> bullets;
ArrayList<Asteroid> asteroids;
Spaceship ship;
int score = 0;

void setup() {
  size(800, 600);
  ship = new Spaceship();
  bullets = new ArrayList<>();
  asteroids = new ArrayList<>();

  // Add some initial asteroids
  for (int i = 0; i < 5; i++) {
    asteroids.add(new Asteroid());
  }
}

void draw() {
  background(0);

  // Draw stars
  for (int i = 0; i < 100; i++) {
    Star star = new Star();
    star.show();
  }

  // Move and show the spaceship
  ship.move();
  ship.show();

  // Move and show bullets
  for (int i = bullets.size() - 1; i >= 0; i--) {
    Bullet b = bullets.get(i);
    b.move();
    b.show();

    // Remove bullets that are no longer alive
    if (b.isAlive() == false) bullets.remove(i);
  }

  // Move and show asteroids
  for (int i = asteroids.size() - 1; i >= 0; i--) {
    Asteroid a = asteroids.get(i);
    a.moveAsteroid();
    a.show();

    // Check for collisions with bullets
    for (int j = bullets.size() - 1; j >= 0; j--) {
      Bullet b = bullets.get(j);
      if (dist((float) a.getCenterX(), (float) a.getCenterY(), (float) b.myCenterX, (float) b.myCenterY) < 20) {
        asteroids.remove(i);
        bullets.remove(j);
        score += 10;
        break;
      }
    }
  }

  // Regenerate asteroids if the count falls below 5
  if (asteroids.size() < 5) {
    for (int i = 0; i < 3; i++) { // Add 3 new asteroids
      asteroids.add(new Asteroid());
    }
  }

  // Display the score
  fill(255);
  textSize(20);
  text("Score: " + score, 10, 30);
}

void keyPressed() {
  if (key == 'w') ship.accelerate();
  if (key == 's') ship.decelerate();
  if (key == 'a') ship.turn(-15);
  if (key == 'd') ship.turn(15);
  if (key == ' ') bullets.add(new Bullet(ship));
  if (key == 'h') ship.hyperspace();
}
