class Floater {
  public float x;
  public float y;
  public float speed;
  public float pointDirection;
  public int[] cornersX;
  public int[] cornersY;
  public int bodyColor;
  public int detailColor;

  public Floater() {
    x = 0;
    y = 0;
    speed = 0;
    pointDirection = 0;
    cornersX = new int[0];
    cornersY = new int[0];
    bodyColor = color(255);
    detailColor = color(255);
  }

  public void move() {
    if (x > width) x = 0;
    if (x < 0) x = width;
    if (y > height) y = 0;
    if (y < 0) y = height;
  }

  public void show() {
    // Placeholder - does nothing by default
  }
}

