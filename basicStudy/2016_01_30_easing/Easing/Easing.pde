float currentX, currentY = 0.0;
float targetX, targetY = 0.0;
float easing = 0.1;
float radius = 40;

void setup() {
  size(displayWidth, displayHeight);
}

void draw() {
  background(0);
  noStroke();
  
  float distX = targetX - currentX;
  float distY = targetY - currentY;
  
  if (abs(distX) > 0) {
    currentX += (targetX - currentX) * easing;
  }
  if (abs(distY) > 0) {
    currentY += (targetY - currentY) * easing;
  }
  
  // Destination
  fill(255);
  ellipse(targetX, targetY, radius, radius);
  
  // Current location
  fill(#ff0000);
  ellipse(currentX, currentY, radius, radius);
}

void mouseReleased() {
  targetX = mouseX;
  targetY = mouseY;
}