class Ball {
  float mX;
  float mY;
  float mRadius;
  EaseType mEaseType;
  Easing mEasing;
  
  Ball(float x, float y, float radius, EaseType easeType) {
    mX = x;
    mY = y;
    mRadius = radius;
    mEaseType = easeType;
    mEasing = new Easing(easeType);
  }
  
  void update(float elapsedTimeRate) {
    mX = (width - mRadius * 2) * mEasing.getInterpolation(elapsedTimeRate);
    //mY = 500 * mEasing.getInterpolation(elapsedTimeRate);
  }
  
  void draw() {
    ellipse(mX, mY, mRadius, mRadius);
  }
}