class Particle {
  PVector location;
  PVector speed;
  float radius;
  float threshold;
  color col;
  float thickness;
  
  Particle(PVector location, float radius) {
    this.location = location;
    this.speed = new PVector(1, 1);
    this.radius = radius;
    this.threshold = 10;
    this.thickness = 10;
    this.col = color(getColor());
  }
  
  public void draw() {
    fill(0, thickness);
    noStroke();
  
    speed.x += random(-1, 1);
    speed.y += random(-1, 1);
    location.add(speed);
    
    if (location.x > width) {
      speed.x += random(-3, -1);
    } else if(location.x < 0) {
      speed.x += random(1, 3);
    }
    
    if (location.y > height) {
      speed.y += random(-3, -1);
    } else if(location.y < 0) {
      speed.y += random(1, 3);
    }
    
    if (speed.x > threshold) {
      speed.x = 1;
      this.col = color(getColor());
    }
    if (speed.y > threshold) {
      speed.y = 1;
      this.col = color(getColor());
    }
    
    radius += random(-4, 4);
    
    ellipse(location.x, location.y, radius, radius);
  }
  
  private color getColor() {
    thickness += 20;
    if (thickness >= 255) {
      thickness = 255;
    }
    return color(thickness, thickness, thickness);
    //return color(random(0, 255), random(0, 255), random(0, 255));
  }
}