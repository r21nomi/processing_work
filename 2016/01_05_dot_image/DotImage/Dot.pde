class Dot {
  private PVector mPosition;
  private color mColor;
  private float mBaseRadius;
  private float mRadius;
  private float mDuration;
  
  public Dot(PVector position, color col, float radius) {
    mPosition = position;
    mColor = col;
    mBaseRadius = mRadius = radius;
    mDuration = random(0.01, 0.2);
  }
  
  public void update() {
    mRadius = sin(frameCount * mDuration) * mBaseRadius;
  }
  
  public void display() {
    fill(mColor, 100);
    ellipse(mPosition.x + (cos(frameCount * mDuration) * 2),
            mPosition.y + (sin(frameCount * mDuration) * 2),
            mRadius,
            mRadius);
  }
}