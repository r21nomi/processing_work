class Particle {
  PVector location;
  float radius;
  float dirX;
  float dirY;
  
  Particle(PVector location) {
    this.location = location;
    radius = 4;
    dirX = random(-1, 1);
    dirY = random(-1, 1);
  }
  
  PVector getLocation() {
    return location;
  }
  
  void update() {
    PVector velocity = new PVector(dirX, dirY);
    location.add(velocity);
  }
  
  void updateDir(int x, int y) {
    dirX *= x;
    dirY *= y;
  }
  
  void display() {
    fill(0, 150);
    noStroke();
    ellipse(location.x, location.y, radius, radius);
  }
}
