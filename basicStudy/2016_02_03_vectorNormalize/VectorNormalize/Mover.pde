/**
 * Do not use PVector
 * FIXME：thre is a bug that the speed is different from VectorMover's
 */
class Mover {
  float x, y;
  float speedX, speedY;
  float accelerationX;
  float accelerationY;
  float maxSpeed;
  
  Mover(float x, float y) {
    this.x = x;
    this.y = y;
    speedX = 0;
    speedY = 0;
    accelerationX = 0.5;
    maxSpeed = 10;
  }
  
  void update(float targetX, float targetY) {
    float distX = targetX - x;
    float distY = targetY - y;
    
    if (abs(distX) < 10 && abs(distY) < 10) {
     speedX = speedY = 0;
     accelerationX = accelerationY = 0;
     return; 
    }
    
    accelerationX = norm(distX, 0, width);
    accelerationY = norm(distY, 0, height);
    
    accelerationX *= 0.5;
    accelerationY *= 0.5;
    
    speedX += accelerationX;
    speedY += accelerationY;
    
    if (speedX > maxSpeed) {
      speedX = maxSpeed; 
    }
    if (speedY > maxSpeed) {
      speedY = maxSpeed;
    }
    
    x += speedX;
    y += speedY;
  }
  
  void display() {
    fill(255);
    ellipse(x, y, 10, 10);
  }
}