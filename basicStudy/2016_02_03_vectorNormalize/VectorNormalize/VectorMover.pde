class VectorMover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float maxSpeed;
  
  VectorMover(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    maxSpeed = 10;
  }
  
  void update(float targetX, float targetY) {
    PVector dir = PVector.sub(new PVector(targetX, targetY), location);
    
    if (dir.mag() < 10) {
      velocity = new PVector(0, 0);
      return;
    }
    
    dir.normalize();
    dir.mult(0.5);
    acceleration = dir;
    
    velocity.add(dir);
    velocity.limit(maxSpeed);
    location.add(velocity);
  }
  
  void display() {
    fill(#ff0000);
    ellipse(location.x, location.y, 10, 10);
  }
}