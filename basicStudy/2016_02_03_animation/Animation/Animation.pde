static final float FPS = 60;
static final float ONE_MS = 1000;
float targetX, targetY = 0;
float x, y = 0;
float currentTime = 0;
float totalTime = 2000;

void setup() {
  frameRate(FPS);
  size(800, 800);
}

void draw() {
  fill(0);
  rect(0, 0, width, height);
  
  if (currentTime < totalTime) {
    float rate = getEasing();
    float _x = x + targetX * rate;
    float _y = y + targetY * rate;
    
    fill(255);
    ellipse(_x, _y, 10, 10);
    
    currentTime += (ONE_MS / frameRate);  // if FPS is 60, (ONE_MS / FPS) will be 16.6.
  }
}

void mouseReleased() {
  currentTime = 0;
  targetX = mouseX;
  targetY = mouseY;
}

float getEasing() {
  return pow(getNormalizedCurrentTime(), 4);
  //return pow(currentTime / ONE_MS / (totalTime / ONE_MS), 4);
}

/**
 * Convert the range of currentTime from (0 ~ totalTime) to (0.0 ~ 1.0).
 */
float getNormalizedCurrentTime() {
  return norm(currentTime, 0, totalTime);
}