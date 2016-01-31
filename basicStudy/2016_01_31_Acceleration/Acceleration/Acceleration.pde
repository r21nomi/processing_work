float y1, y2;
float velocity1, velocity2;
float mass1 = 1.0;
float mass2 = 6.0;
float stiffness = 0.1; 
float damping = 0.9;

void setup() { 
  size(800, 800); 
  noStroke();
} 

void draw() { 
  fill(0, 30);
  rect(0, 0, width, height);
  fill(255);
  
  float targetY = mouseY;
  
  float forceA = stiffness * (targetY - y1);
  // 力 = 質量 * 加速度（F = ma）
  // 加速度 = 力 / 質量
  float accelerationY1 = forceA / mass1;
  velocity1 = damping * (velocity1 + accelerationY1); 
  y1 += velocity1;   
  rect(10, y1, width / 2 - 20, 15);  
  
  float forceB = stiffness * (targetY - y2); 
  float accelerationY2 = forceB / mass2;
  velocity2 = damping * (velocity2 + accelerationY2); 
  y2 += velocity2; 
  rect(width / 2 + 10, y2, width / 2 - 20, 15);
}