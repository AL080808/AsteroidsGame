Spaceship ship;
Star[] stars;
ArrayList<Asteroid> asteroids; // ArrayList to manage asteroids
int spawnTimer = 0; // Timer for spawning new asteroids
int spawnInterval = 200; // Interval for spawning new asteroids (frames)

void setup() {
  size(800, 600);
  ship = new Spaceship();
  stars = new Star[100];
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  asteroids = new ArrayList<Asteroid>();
  for (int i = 0; i < 5; i++) { // Add initial asteroids
    asteroids.add(new Asteroid());
  }
}

void draw() {
  background(0);

  // Draw stars
  for (Star star : stars) {
    star.show();
  }

  // Move and draw asteroids
  for (int i = asteroids.size() - 1; i >= 0; i--) {
    Asteroid asteroid = asteroids.get(i);
    asteroid.moveAsteroid(); // Use the custom move function
    asteroid.show();

    // Check for collision
    float distance = dist((float) ship.myCenterX, (float) ship.myCenterY,
                          asteroid.getCenterX(), asteroid.getCenterY());
    if (distance < 20) { // Collision threshold
      println("Collision detected! Asteroid removed.");
      asteroids.remove(i); // Remove asteroid from ArrayList
    }
  }

  // Spawn new asteroids periodically
  spawnTimer++;
  if (spawnTimer >= spawnInterval) {
    asteroids.add(new Asteroid());
    spawnTimer = 0; // Reset timer
  }

  // Move and draw the spaceship
  ship.move();
  ship.show();

  // Instructions
  fill(255);
  textSize(18);
  textAlign(CENTER);
  text("Use Arrow Keys to Move\n[Up: Accelerate, Down: Decelerate, Left/Right: Turn, H: Hyperspace]", width / 2, height - 50);
}

void keyPressed() {
  if (keyCode == UP) {
    ship.accelerate(); // Accelerate forward
  }
  if (keyCode == DOWN) {
    ship.decelerate(); // Slow down
  }
  if (keyCode == LEFT) {
    ship.turn(-10); // Turn left
  }
  if (keyCode == RIGHT) {
    ship.turn(10); // Turn right
  }
  if (key == 'h' || key == 'H') {
    ship.hyperspace(); // Teleport to a random location
  }
}
