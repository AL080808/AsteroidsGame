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
  for (Star star : stars) {
    star.show();
  }
  ship.move();
  ship.show();
  fill(255);
  textSize(18);
  textAlign(CENTER);
  text("Use Arrow Keys to Move\n[Up: Up, Down: Down, Left: Left, Right: Right, H: Hyperspace]", width / 2, height - 50);
}

void keyPressed() {
  if (keyCode == UP) {
    ship.moveUp();
  }
  if (keyCode == DOWN) {
    ship.moveDown();
  }
  if (keyCode == LEFT) {
    ship.moveLeft();
  }
  if (keyCode == RIGHT) {
    ship.moveRight();
  }
  if (key == 'h' || key == 'H') {
    ship.hyperspace();
  }
}
