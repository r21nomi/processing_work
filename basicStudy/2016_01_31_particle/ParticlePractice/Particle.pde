class Particle {
  float x, y;
  float vx, vy;
  float radius;
  float gravity;
  
  Particle(float posX, float posY, float velX, float velY, float r) {
    x = posX;
    y = posY;
    vx = velX;
    vy = velY;
    radius = r;
    gravity = 0.4;
  }
  
  void update() {
    vy += gravity;
    x += vx;
    y += vy;
  }
  
  void display() {
    ellipse(x, y, radius * 2, radius * 2);
  }
}