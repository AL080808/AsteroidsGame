class Star {
  private float x;
  private float y;
  private int brightness;

  public Star() {
    x = (float) (Math.random() * width);
    y = (float) (Math.random() * height);
    brightness = (int) (Math.random() * 255);
  }

  public void show() {
    fill(brightness);
    noStroke();
    ellipse(x, y, 3, 3);
  }
}
