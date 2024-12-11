class Asteroid extends Floater {
  private float rotationSpeed; // Speed of rotation

  public Asteroid() {
    corners = 6; // Number of corners for hexagonal shape
    xCorners = new int[] { -10, 5, 12, 8, -5, -12 }; // Random asteroid shape
    yCorners = new int[] { -8, -10, -5, 10, 12, 5 };
    myColor = color(200); // Gray color
    myCenterX = random(width); // Random position
    myCenterY = random(height);
    myXspeed = random(-1, 1); // Random x speed
    myYspeed = random(-1, 1); // Random y speed
    myPointDirection = random(360); // Random initial rotation
    rotationSpeed = random(-2, 2); // Random rotation speed
  }

  // Custom move function for Asteroid
  public void moveAsteroid() {
    myCenterX += myXspeed;
    myCenterY += myYspeed;
    myPointDirection += rotationSpeed;

    // Wrap around screen
    if (myCenterX > width) myCenterX = 0;
    if (myCenterX < 0) myCenterX = width;
    if (myCenterY > height) myCenterY = 0;
    if (myCenterY < 0) myCenterY = height;
  }

  // Accessor methods for myCenterX and myCenterY
  public float getCenterX() {
    return (float) myCenterX;
  }

  public float getCenterY() {
    return (float) myCenterY;
  }
}
