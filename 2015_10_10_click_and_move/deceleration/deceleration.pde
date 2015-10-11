private PVector mLocation = new PVector(0, 0);
private PVector mDistination = new PVector(0, 0);
private float mEasing = 0.15;
private float mRadius = 20;

void setup() {
  size(displayWidth, displayHeight);
  noStroke();
}

void draw() {
  fill(255);
  rect(0, 0, width, height);
  
  float distX = mDistination.x - mLocation.x;
  float distY = mDistination.y - mLocation.y;
  
  if (abs(distX) > 1.0 && abs(distY) > 1.0) {
    mLocation.x += distX * mEasing;
    mLocation.y += distY * mEasing;
  }
  
  fill(0);
  ellipse(mLocation.x, mLocation.y, mRadius, mRadius);
}

void mouseReleased() {
  mDistination = new PVector(mouseX, mouseY);
}