class Mover {
  
  PGraphics mOffscreen;
  PVector mLocation;
  PVector mVelocity;
  float radius;
  
  Mover(PGraphics offscreen, float x, float y) {
    mOffscreen = offscreen;
    mLocation = new PVector(x, y);
    mVelocity = new PVector(130, 130);
    radius = 80;
  }
  
  void update() {
    mLocation.add(mVelocity);
  }
  
  void display() {
    mOffscreen.beginDraw();
    mOffscreen.background(255);
    mOffscreen.fill(50);
    mOffscreen.ellipse(mLocation.x, mLocation.y, radius, radius);
    mOffscreen.endDraw();
  }
  
  void checkEdges() {
     if (mLocation.x > width - radius/2 || mLocation.x < radius/2) {
       mVelocity.x *= -1;
     }
     if (mLocation.y > height - radius/2 || mLocation.y < radius/2) {
       mVelocity.y *= -1;
     }
  }
}
