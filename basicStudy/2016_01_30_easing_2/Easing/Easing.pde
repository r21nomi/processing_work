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
boolean isCalcultingFormulaMode = false;

ControlP5 cp5;
Slider durationSlider;

void setup() {
  frameRate(FPS);
  size(displayWidth, displayHeight);
  
  cp5 = new ControlP5(this);
  durationSlider = cp5.addSlider(DURATION_SLIDER_NAME);
  durationSlider.setPosition(20, 20).setSize(100, 20);
}

void draw() {
  fill(0, 100);
  rect(0, 0, width, height);
  
  println(getDuration());
  
  if (elapsedTime < getDuration()) {
    elapsedTime += (ONE_MS / frameRate);
    
    if (isCalcultingFormulaMode) {
      currentX = getCalcultingFormula(beginX, distX);
      currentY = getCalcultingFormula(beginY, distY);
      
    } else {
      float rate = getRate(getNormalizedCurrentTime());
      currentX = beginX + (rate * distX);
      currentY = beginY + (rate * distY);
    }
  }
  
  fill(#ffcc00);
  ellipse(currentX, currentY, radius, radius);
  
  fill(#ffffff);
  text(isCalcultingFormulaMode ? "calculting formula mode" : "exponent function mode", 20, 80);
  text("currentEasingMode : " + currentEasingMode, 20, 100);
  text("duration : " + getDuration() + "ms", 20, 120);
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
    case ' ':
    isCalcultingFormulaMode = !isCalcultingFormulaMode;
    break;
    
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

float getCalcultingFormula(float startVal, float difference) {
  switch(currentEasingMode) {
    case 1:
      return easeInQuad(elapsedTime, startVal, difference, getDuration());
      
    case 2:
      return easeOutQuad(elapsedTime, startVal, difference, getDuration());
      
    case 3:
      return easeInOutQuad(elapsedTime, startVal, difference, getDuration());
      
    case 4:
      return easeInCubic(elapsedTime, startVal, difference, getDuration());
      
    default:
      return linearTween(elapsedTime, startVal, difference, getDuration());
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

/**
 * @param t current time
 * @param b initial value
 * @param c difference between and start value end value
 * @param d duration 
 *
 * @See http://gizma.com/easing/
 */
float linearTween(float t, float b, float c, float d) {
  return c*t/d + b;
}

float easeInQuad(float t, float b, float c, float d) {
  t /= d;
  return c*t*t + b;
}

float easeOutQuad(float t, float b, float c, float d) {
  t /= d;
  return -c * t*(t-2) + b;
}

float easeInOutQuad(float t, float b, float c, float d) {
  t /= d/2;
  if (t < 1) return c/2*t*t + b;
  t--;
  return -c/2 * (t*(t-2) - 1) + b;
}

float easeInCubic(float t, float b, float c, float d) {
  t /= d;
  return c*t*t*t + b;
}