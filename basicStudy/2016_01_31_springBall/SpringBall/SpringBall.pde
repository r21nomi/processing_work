float currentX, currentY = 0;
float targetX, targetY = 0;
float velocityX, velocityY = 0;
float stiffness = 0.1;
float damping = 0.9;
float radius = 20;

void setup() {
  size(800, 800);
}

void draw() {
  noStroke();
  fill(0, 30);
  rect(0, 0, width, height);
  
  // force = バネ定数 * (目標地点 - 現在地点);
  float forceX = stiffness * (targetX - currentX);
  float forceY = stiffness * (targetY - currentY);
  
  velocityX = damping * (velocityX + forceX);
  velocityY = damping * (velocityY + forceY);
  
  currentX += velocityX;
  currentY += velocityY;
  
  fill(255);
  ellipse(currentX, currentY, radius * 2, radius * 2);
}

void mouseReleased() {
  targetX = mouseX;
  targetY = mouseY;
  velocityX = velocityY = 0;
}