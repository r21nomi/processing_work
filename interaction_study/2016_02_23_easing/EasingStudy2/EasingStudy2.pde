static final float FPS = 60;
static final float ONE_MS = 1000;
Easing mEasing;
EaseType mCurrentEaseType;
float mElapsedTime;
float mDuration = 1000;
float mRadius = 400;
float mBaseRadius = 200;

void setup() {
  frameRate(FPS);
  size(displayWidth, displayHeight);
  
  mCurrentEaseType = EaseType.BACK_OUT;
  mEasing = new Easing(mCurrentEaseType);
}

void draw() {
  fill(0, 100);
  noStroke();
  rect(0, 0, width, height);
  
  pushMatrix();
  translate(width / 2, height / 2);
  
  float rate = mEasing.getInterpolation(map(mElapsedTime, 0, mDuration, 0, 1));
  
  fill(255);
  ellipse(0, 0, mRadius * rate + mBaseRadius, mRadius * rate + mBaseRadius);
  
  popMatrix();
  
  if (mElapsedTime < mDuration) {
    mElapsedTime += (ONE_MS / frameRate);
  }
}

void mouseReleased() {
  int num = (int)random(0, EaseType.values().length - 1);
  mCurrentEaseType = EaseType.values()[num];
  mEasing.setEaseType(mCurrentEaseType);
  
  mElapsedTime = 0;
}