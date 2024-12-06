Spaceship ship;
Star[] stars;

void setup() {
  size(800, 600);
  ship = new Spaceship();
  stars = new Star[100];
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
}

void draw() {
  background(0);

  // Draw stars
  for (Star star : stars) {
    star.show();
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
