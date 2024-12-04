class Spaceship extends Floater {
  public Spaceship() {
    x = width / 2;
    y = height / 2;
    speed = 5;
    pointDirection = 0;
    cornersX = new int[] { 20, -15, -10, -15, 20 };
    cornersY = new int[] { 0, -10, 0, 10, 0 };
    bodyColor = color(0, 150, 255);
    detailColor = color(200, 50, 50);
  }

  public void moveUp() {
    y -= speed;
  }

  public void moveDown() {
    y += speed;
  }

  public void moveLeft() {
    x -= speed;
  }

  public void moveRight() {
    x += speed;
  }

  public void hyperspace() {
    x = (float) (Math.random() * width);
    y = (float) (Math.random() * height);
    pointDirection = (float) (Math.random() * 360);
  }

  public void show() {
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
