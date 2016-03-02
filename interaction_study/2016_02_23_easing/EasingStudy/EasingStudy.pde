static final float FPS = 60;
static final float ONE_MS = 1000;
float mElapsedTime;
float mTotalDuration = 1000;
ArrayList<Ball> mBalls = new ArrayList();

void setup() {
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
  }
  
  fill(255, 200);
  for (Ball ball : mBalls) {
    ball.update(getNormalizedCurrentTime());
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