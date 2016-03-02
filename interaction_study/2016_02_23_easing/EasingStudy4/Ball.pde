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
  
  void update(float elapsedTimeRate, boolean reverse) {
    mX = (width - mRadius * 2) * map(mEasing.getInterpolation(elapsedTimeRate), 0, 1, 0, 1);
    if (reverse) {
      mX = (width - mRadius * 2) * map(mEasing.getInterpolation(elapsedTimeRate), 0, 1, 1, 0);
    }
  }
  
  void draw() {
    ellipse(mX, mY, mRadius, mRadius);
  }
}