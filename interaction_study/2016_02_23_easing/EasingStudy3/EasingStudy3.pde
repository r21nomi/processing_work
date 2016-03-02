static final float FPS = 60;
static final float ONE_MS = 1000;
float mElapsedTime;
float mDuration = 1000;
float mRadius = 400;
float mBaseRadius = 200;
float yoff = 0.0;
ArrayList<Easing> mEasings = new ArrayList();
int now = 1;

void setup() {
  frameRate(FPS);
  size(displayWidth, displayHeight);
  
  init();
}

void draw() {
  fill(0, 100);
  noStroke();
  rect(0, 0, width, height);
  
  fill(255);
  beginShape();
 
  float xoff = 0;
  int index = 0;
  for (float x = 0; x <= width; x += 1) {
    //float y = map(noise(xoff, yoff), 0, 1, height / 1.2, height / 2);
    float rate = mEasings.get(index).getInterpolation(map(mElapsedTime, 0, mDuration, 0, 1));
    if (now < 0) {
      rate = mEasings.get(index).getInterpolation(map(mElapsedTime, 0, mDuration, 1, 0));
    }
    float y = map(rate * 2, 0, 1, height / 1.2, height / 2);
    vertex(x, y); 
    xoff += 0.005;
    index++;
  }
  
  yoff += 0.01;
  
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  
  if (mElapsedTime < mDuration) {
    mElapsedTime += (ONE_MS / frameRate);
    
  } else {
    reset();
  }
}

void init() {
  mEasings = new ArrayList();
  
  for (float x = 0; x <= width; x += 1) {
    int num = (int)random(0, EaseType.values().length - 1);
    mEasings.add(new Easing(EaseType.values()[num]));
  }
}

void reset() {
  mElapsedTime = 0;
  now *= -1;
}

void mouseReleased() {
  init();
}