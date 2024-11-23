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

abstract class Floater {
  protected float x, y, speed, pointDirection;
  protected int[] cornersX, cornersY;
  protected int bodyColor, detailColor;

  void move() {
    if (x > width) x = 0;
    if (x < 0) x = width;
    if (y > height) y = 0;
    if (y < 0) y = height;
  }

  void show() {}
}

class Spaceship extends Floater {
  Spaceship() {
    x = width / 2;
    y = height / 2;
    speed = 5;
    pointDirection = 0;
    cornersX = new int[]{20, -15, -10, -15, 20};
    cornersY = new int[]{0, -10, 0, 10, 0};
    bodyColor = color(0, 150, 255);
    detailColor = color(200, 50, 50);
  }

  void moveUp() {
    y -= speed;
  }

  void moveDown() {
    y += speed;
  }

  void moveLeft() {
    x -= speed;
  }

  void moveRight() {
    x += speed;
  }

  void hyperspace() {
    x = (float)(Math.random() * width);
    y = (float)(Math.random() * height);
    pointDirection = (float)(Math.random() * 360);
  }

  void show() {
    pushMatrix();
    translate(x, y);
    rotate(radians(pointDirection));
    fill(bodyColor);
    stroke(255);
    strokeWeight(2);
    beginShape();
    for (int i = 0; i < cornersX.length; i++) {
      vertex(cornersX[i], cornersY[i]);
    }
    endShape(CLOSE);

    fill(detailColor);
    ellipse(5, 0, 10, 10);
    popMatrix();
  }
}

class Star {
  float x, y;
  int brightness;

  Star() {
    x = (float)(Math.random() * width);
    y = (float)(Math.random() * height);
    brightness = (int)(Math.random() * 255);
  }

  void show() {
    fill(brightness);
    noStroke();
    ellipse(x, y, 3, 3);
  }
}
