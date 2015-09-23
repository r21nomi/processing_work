class Triangle {
  
  private PVector mLocation;
  private float mAngle;
  private int mWidth;
  private int mHeight;
  private int mThickness;

  Triangle(PVector location, int width, int height) {
    mLocation = location;
    mWidth = width;
    mHeight = height;
    mAngle = 0;
    mThickness = 100;
  }

  void update(float x, float y) {
    mAngle = atan2(y - mLocation.y, x - mLocation.x);
  }
  
  PVector getLocation() {
    return mLocation;
  }
  
  void changeThickness(int thickness) {
    mThickness = thickness;
  }

  void draw() {
    noStroke();
    fill(100, mThickness);
    
    pushMatrix();
    translate(mLocation.x, mLocation.y);
    rotate(mAngle);
    // 横向きの三角形（上向き、下向きでは頂点が適切な対象方向に向かない）
    triangle(-mHeight / 2, -mWidth / 2, mHeight / 2, 0, -mHeight / 2, mWidth / 2);
    popMatrix();
  }
}