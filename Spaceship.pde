class Spaceship extends Floater {
  public Spaceship() {
    corners = 5;
    xCorners = new int[] { 20, -15, -10, -15, 20 }; // Custom shape
    yCorners = new int[] { 0, -10, 0, 10, 0 };
    myColor = color(0, 150, 255);
    myCenterX = width / 2;
    myCenterY = height / 2;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
  }

  // Accelerate the spaceship
  public void accelerate() {
    double radians = myPointDirection * (Math.PI / 180);
    myXspeed += 0.1 * Math.cos(radians);
    myYspeed += 0.1 * Math.sin(radians);
  }

  // Decelerate the spaceship
  public void decelerate() {
    myXspeed *= 0.9; // Reduce speed
    myYspeed *= 0.9;
  }

  // Move the spaceship
  public void move() {
    myCenterX += myXspeed;
    myCenterY += myYspeed;

    // Wrap around the screen
    if (myCenterX > width) myCenterX = 0;
    if (myCenterX < 0) myCenterX = width;
    if (myCenterY > height) myCenterY = 0;
    if (myCenterY < 0) myCenterY = height;
  }

  // Hyperspace jump to a random position
  public void hyperspace() {
    myCenterX = Math.random() * width;
    myCenterY = Math.random() * height;
    myPointDirection = Math.random() * 360;
    myXspeed = 0;
    myYspeed = 0; // Reset speed after hyperspace
  }
}

