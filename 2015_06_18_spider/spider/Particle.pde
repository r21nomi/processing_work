class Particle {
  
  PVector location;
  float radius;

  Particle(PVector location) {
    this.location = location;
    radius = 5;
  }
  
  PVector getLocation() {
    return location;
  }
  
  void update() {
    PVector velocity = new PVector(getRandom(), getRandom());
    location.add(velocity);
  }
  
  float getRandom() {
    return random(-0.5, 0.5);
  }

  void display() {
    fill(100);
    noStroke();
    ellipse(location.x, location.y, radius, radius);
  }
}
