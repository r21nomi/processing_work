class Particle {
  
  PVector location;
  float radius = 0;
  float moving = 0;
  float maxRange = 5;

  Particle(PVector location) {
    this.location = location;
  }
  
  PVector getLocation() {
    return location;
  }
  
  void update() {
    float m = getRandom();
    // ブレ幅を設定
    if (moving + m < maxRange && moving + m > -maxRange) {
      moving += m;
      location.add(new PVector(m, m));
    }
  }
  
  float getRandom() {
    return random(-0.5, 0.5);
  }

  void display() {
    fill(255);
    noStroke();
    ellipse(location.x, location.y, radius, radius);
  }
}
