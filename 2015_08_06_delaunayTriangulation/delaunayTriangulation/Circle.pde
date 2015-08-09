class Circle {
  
  Point mCenter;
  float mRadius;
  
  Circle(Point center, float radius) {
    mCenter = center;
    mRadius = radius;
  }
  
  public Point getCenter() {
    return mCenter;
  }
  
  public float getRadius() {
    return mRadius;
  }
  
  public void draw() {
    ellipse(mCenter.x, mCenter.y, mRadius * 2, mRadius * 2);
  }
}
