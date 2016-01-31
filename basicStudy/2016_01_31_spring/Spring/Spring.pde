float stiffness = 0.1;
float damping = 0.9;
float velocityY = 0.0;
float targetY = 0.0;
float y = 0.0;

void setup() {
  size(800, 800);
  noStroke();
}

void draw() {
  fill(0, 12);
  rect(0, 0, width, height);
  
  fill(255);
  // フックの法則（f = -kx）
  // k: バネ定数（0.0 ~ 1.0）
  // x: バネが伸びている長さ（現在地 - 目標地）
  // force = -stiffness * (y - targetY);
  float force = stiffness * (targetY - y);
  
  velocityY = damping * (velocityY + force);
  y += velocityY;
  rect(10, y, width - 20, 12);
  targetY = mouseY;
}