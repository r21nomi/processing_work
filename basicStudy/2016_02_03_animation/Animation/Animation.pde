float targetX, targetY = 0;
float x, y = 0;
float currentTime = 0;
float time = 2000;

void setup() {
  size(800, 800);
}

void draw() {
  fill(0);
  rect(0, 0, width, height);
  
  if (currentTime > time) {
    return; 
  }
  
  float rate = getEasing();
  
  fill(255);
  ellipse(x + targetX * rate, y + targetY * rate, 10, 10);
  
  currentTime += 16.6;  // 1000 ms / 60 frame
}

void mouseReleased() {
  currentTime = 0;
  targetX = mouseX;
  targetY = mouseY;
}

float getEasing() {
  return pow(currentTime / 1000 / (time / 1000), 4);
}