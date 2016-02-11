float currentX, currentY = 0.0;
float beginX, beginY = 0.0;
float targetX, targetY = 0.0;
float distX, distY = 0.0;
float easing = 0.1;
float radius = 40;
float exponent = 4.0;
float step = 0.01;
float pct = 0.0;
int currentEasingMode = 0;

void setup() {
  size(displayWidth, displayHeight);
}

void draw() {
  fill(0, 100);
  rect(0, 0, width, height);
  
  if (pct <= 1.0) {
    pct += step;
    float rate = getRate(pct);
    currentX = beginX + (rate * distX);
    currentY = beginY + (rate * distY);
  }
  
  fill(#ff0000);
  ellipse(currentX, currentY, radius, radius);
}

void mouseReleased() {
  pct = 0;
  beginX = currentX;
  beginY = currentY;
  targetX = mouseX;
  targetY = mouseY;
  distX = targetX - currentX;
  distY = targetY - currentY;
}

void keyPressed() {
  switch(key) {
    case '1':
      currentEasingMode = 1;
      break;
      
    case '2':
      currentEasingMode = 2;
      break;
      
    case '3':
      currentEasingMode = 3;
      break;
      
    case '4':
      currentEasingMode = 4;
      break;
      
    default:
      currentEasingMode = 0;
  }
}

private float getRate(float val) {
  switch(currentEasingMode) {
    case 1:
      // x^2
      return pow(val, 2);
      
    case 2:
      // x^4
      return pow(val, 4);
      
    case 3:
      // 1 - (1 - x)^4
      return 1 - pow(1 - val, 4);
      
    case 4:
      // x^0.25
      return pow(val, 0.25);
      
    default:
      return pow(val, exponent);
  }
}