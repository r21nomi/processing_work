class Rider {
  static final float SPEED = 20; 
  float x, y;
  float speedX, speedY;
  float radius;
  
  Rider(float x, float y) {
    this.x = x;
    this.y = y;
    speedX = SPEED;
    speedY = 0;
    radius = 10;
  }
  
  void update() {
    x += speedX;
    y += speedY;
  }
  
  void check() {
    if (x > width - radius) {
      speedY = -SPEED;
      speedX = 0;
      x = width - radius;
    }
    if (x < radius) {
      speedY = SPEED;
      speedX = 0;
      x = radius;
    }
    if (y > height - radius) {
      speedX = SPEED;
      speedY = 0;
      y = height - radius;
    }
    if (y < radius) {
      speedX = -SPEED;
      speedY = 0;
      y = radius;
    }
  }
  
  void display() {
    ellipse(x, y, radius * 2, radius * 2);
  }
}