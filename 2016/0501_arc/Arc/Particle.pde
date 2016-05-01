class Particle {
  PVector location;
  float radius;
  int startDegree;
  int currentDegree;
  boolean isFirstItem;
  
  Particle(float x, float y, float radius, int startDegree, boolean isFirstItem) {
    this.location = new PVector(x, y);
    this.radius = radius;
    this.startDegree = this.currentDegree = startDegree;
    this.isFirstItem = isFirstItem;
  }
  
  void update(float radius) {
    currentDegree += 3;
    if (currentDegree - startDegree < 360) {
      float val = easeInOutExpo(map(currentDegree - startDegree, 0, 360, 0, 1));
      location.x = radius * val * cos(radians(startDegree) * val);
      location.y = radius * val * sin(radians(startDegree) * val);
    }
  }
  
  void draw() {
    if (isFirstItem) {
      fill(255, 0, 0, 100);
    } else {
      fill(0, 100);
    }
    ellipse(location.x, location.y, radius, radius);
  }
}