class Spring2D {
  float vx, vy;
  float x, y;
  float mass;
  float gravity;
  float radius = 10;
  float stiffness = 0.2;
  float damping = 0.7;
  
  Spring2D(float posX, float posY, float m, float g) {
    x = posX;
    y = posY;
    mass = m;
    gravity = g;
  }
  
  void update(float targetX, float targetY) {
    float forceX = stiffness * (targetX - x);
    float ax = forceX / mass;
    vx = damping * (vx + ax);
    x += vx;
    
    float forceY = stiffness * (targetY - y);
    forceY += gravity;
    float ay = forceY / mass;
    vy = damping * (vy + ay);
    y += vy;
  }
  
  void display(float nx, float ny) {
    noStroke();
    ellipse(x, y, radius * 2, radius * 2);
    stroke(255);
    line(x, y, nx, ny);
  }
}