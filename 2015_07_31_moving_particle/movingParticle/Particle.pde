class Particle {
  
  PVector location;
  PVector destination;
  float radius;
  PVector lastPoint;
  ArrayList<Line> lines;
  
  Particle(PVector p) {
    location = p;
    lastPoint = p;
    radius = 40; //<>//
    destination = new PVector(p.x, p.y);
    lines = new ArrayList();
  }
 
  void update() {
    float speedX = (destination.x - location.x) / 8.0;
    float speedY = (destination.y - location.y) / 8.0;
    location.add(new PVector(speedX, speedY));
    
    float dist = location.dist(lastPoint);
    if (lines.size() == 0) {
      lines.add(new Line(new PVector(location.x, location.y), new PVector(location.x, location.y)));
    }
    else if (dist >= 10) {
      lines.add(new Line(new PVector(location.x, location.y), new PVector(lines.get(lines.size() - 1).getStartX(), lines.get(lines.size() - 1).getStartY())));
      lastPoint = new PVector(location.x, location.y);
    }
  }
  
  void setDestination(PVector destination) {
    this.destination = destination;
    
    lines.clear();
    lastPoint = new PVector(location.x, location.y);
  }
 
  void draw() {
    fill(255, 245);
    noStroke();
    ellipse(location.x ,location.y ,radius ,radius);
    
    for (int i = 0, len = lines.size(); i < len; i++) {
      lines.get(i).updateAndDraw();
    }
  }  
}
