class Bullet extends Floater {
  private int lifespan;

  public Bullet(Spaceship theShip) {
    myCenterX = theShip.myCenterX;
    myCenterY = theShip.myCenterY;
    myPointDirection = theShip.myPointDirection;

    double radians = Math.toRadians(myPointDirection);
    myXspeed = theShip.myXspeed + 6 * Math.cos(radians);
    myYspeed = theShip.myYspeed + 6 * Math.sin(radians);

    myColor = color(255);
    corners = 0;
    lifespan = 120;
  }

  @Override
  public void move() {
    super.move();
    lifespan--;
  }

  public boolean isAlive() {
    return lifespan > 0;
  }

  @Override
  public void show() {
    fill(myColor);
    noStroke();
    ellipse((float) myCenterX, (float) myCenterY, 5, 5);
  }
}

