 import controlP5.*;

static final float FPS = 60;
static final float ONE_MS = 1000;
static final String DURATION_SLIDER_NAME = "duration";

int currentEasingMode = 0;
float currentX, currentY = 0.0;
float beginX, beginY = 0.0;
float targetX, targetY = 0.0;
float distX, distY = 0.0;
float radius = 40;
float elapsedTime = 0;
float totalDuration = 500;

ControlP5 cp5;
Slider durationSlider;

void setup() {
  frameRate(FPS);
  size(displayWidth, displayHeight);
  
  cp5 = new ControlP5(this);
  durationSlider = cp5.addSlider(DURATION_SLIDER_NAME);
  durationSlider.setPosition(20,20).setSize(100,20);
}

void draw() {
  fill(0, 100);
  rect(0, 0, width, height);
  
  println(getDuration());
  
  if (elapsedTime < getDuration()) {
    elapsedTime += (ONE_MS / frameRate);
    
    float rate = getRate(getNormalizedCurrentTime());
    currentX = beginX + (rate * distX);
    currentY = beginY + (rate * distY);
  }
  
  fill(#ff0000);
  ellipse(currentX, currentY, radius, radius);
  
  fill(#ffffff);
  text("currentEasingMode:" + currentEasingMode, 20, 80);
}

void mouseReleased() {
  elapsedTime = 0;
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

float getRate(float val) {
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
      return pow(val, 5);
  }
}

float getDuration() {
  return map(durationSlider.getValue(), 0, 100, totalDuration, totalDuration * 3);
}

/**
 * Convert the range of currentTime from (0 ~ totalTime) to (0.0 ~ 1.0).
 */
float getNormalizedCurrentTime() {
  return norm(elapsedTime, 0, getDuration());
}