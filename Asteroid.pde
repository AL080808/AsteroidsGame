class Asteroid extends Floater {
  private float rotationSpeed;

  public Asteroid() {
    corners = 6;
    xCorners = new int[] { -10, 5, 12, 8, -5, -12 };
    yCorners = new int[] { -8, -10, -5, 10, 12, 5 };
    myColor = color(200);
    myCenterX = random(width);
    myCenterY = random(height);
    myXspeed = random(-1, 1);
    myYspeed = random(-1, 1);
    myPointDirection = random(360);
    rotationSpeed = random(-2, 2);
  }

  public void moveAsteroid() {
    myCenterX += myXspeed;
    myCenterY += myYspeed;
    myPointDirection += rotationSpeed;

    if (myCenterX > width) myCenterX = 0;
    if (myCenterX < 0) myCenterX = width;
    if (myCenterY > height) myCenterY = 0;
    if (myCenterY < 0) myCenterY = height;
  }

  public float getCenterX() {
    return (float) myCenterX;
  }

  public float getCenterY() {
    return (float) myCenterY;
  }
}
