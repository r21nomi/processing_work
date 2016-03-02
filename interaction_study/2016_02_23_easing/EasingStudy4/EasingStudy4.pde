static final float FPS = 60;
static final float ONE_MS = 1000;
float mElapsedTime;
float mTotalDuration = 1000;
ArrayList<Ball> mBalls = new ArrayList();
int mNow = 1;

void setup() {
  frameRate(FPS);
  size(displayWidth, displayHeight);
  
  int h = 0;
  float radius = 15;
  for (EaseType easeType : EaseType.values()) {
    mBalls.add(new Ball(radius*2, h, radius, easeType));
    h += (radius + 10);
  }
}

void draw() {
  fill(0, 80);
  noStroke();
  rect(0, 0, width, height);
  
  float x = 0;
  float y = 0;
  
  if (mElapsedTime < getDuration()) {
    mElapsedTime += (ONE_MS / frameRate);
    
  } else {
    mElapsedTime = 0;
    mNow *= -1;
  }
  
  fill(255);
  for (Ball ball : mBalls) {
    ball.update(getNormalizedCurrentTime(), mNow < 0);
    ball.draw();
  }
}

void mouseReleased() {
  mElapsedTime = 0;
}

float getNormalizedCurrentTime() {
  return norm(mElapsedTime, 0, getDuration());
}

float getDuration() {
  return mTotalDuration;
}