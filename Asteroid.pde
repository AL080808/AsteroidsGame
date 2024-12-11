class Asteroid extends Floater {
  private float rotationSpeed; // Speed of rotation

  public Asteroid() {
    corners = 6; // Asteroids are hexagonal
    xCorners = new int[] { -10, 5, 12, 8, -5, -12 }; // Random asteroid shape
    yCorners = new int[] { -8, -10, -5, 10, 12, 5 };
    myColor = color(200); // Gray color for asteroids
    myCenterX = random(width); // Random position
    myCenterY = random(height);
    myXspeed = random(-1, 1); // Random speed in x direction
    myYspeed = random(-1, 1); // Random speed in y direction
    myPointDirection = random(360); // Random direction
    rotationSpeed = random(-2, 2); // Random rotation speed (positive or negative)
  }

  public void moveAsteroid() {
    myPointDirection += rotationSpeed; // Rotate the asteroid
    myCenterX += myXspeed; // Move in x direction
    myCenterY += myYspeed; // Move in y direction

    // Wrap around screen
    if (myCenterX > width) myCenterX = 0;
    if (myCenterX < 0) myCenterX = width;
    if (myCenterY > height) myCenterY = 0;
    if (myCenterY < 0) myCenterY = height;
  }
}
