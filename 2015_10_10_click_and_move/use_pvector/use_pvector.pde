private PVector mLocation = new PVector(0, 0);
private PVector mVelocity = new PVector(0, 0);
private PVector mDestination = new PVector(0, 0);
private PVector mAccelerration = new PVector(0, 0);
private float mTopSpeed = 30;
private float mRadius = 20;

void setup() {
  size(displayWidth, displayHeight);
  noStroke();
}

void draw() {
  fill(255);
  rect(0, 0, width, height);
  
  PVector dir = PVector.sub(mDestination, mLocation);
  if (abs(dir.x) > 10 && abs(dir.y) > 10) {
    dir.normalize();
    dir.mult(10);
    mAccelerration = dir;
    
    mVelocity.add(mAccelerration);
    mVelocity.limit(mTopSpeed);
    mLocation.add(mVelocity);
  } else {
    mLocation = mDestination;
  }
  
  fill(0);
  ellipse(mLocation.x, mLocation.y, mRadius, mRadius);
}

void mouseReleased() {
  mDestination = new PVector(mouseX, mouseY);
  mVelocity = new PVector(0, 0);
}