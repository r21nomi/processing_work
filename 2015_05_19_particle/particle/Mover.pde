class Mover {
  PVector location;
  PVector velocity;
  PVector accelaration;
  float topspeed = 5;
  
  Mover() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(-5, 5);
    accelaration = new PVector(-0.01, 0.01);
  }
  
  void display() {
    stroke(0);
    strokeWeight(2);
    fill(100);
    ellipse(location.x, location.y, 50, 50);
  }
  
  void update() {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector acceleration = PVector.sub(mouse, location);
    acceleration.setMag(0.2);
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }
  
  void check() {
    if (location.x > width || location.x < 0) {
      velocity.x *= -1;
    }
    if (location.y > height || location.y < 0) {
      velocity.y *= -1;
    }
  }
}