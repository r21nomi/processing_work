static final float FPS = 60;
static final float ONE_MS = 1000;
static final float MARGIN = 280;

float x, y = 0;
float radius = 10;
float elapsedTime = 0;
float totalDuration = 500;
boolean isReady = false;

void setup() {
  frameRate(FPS);
  size(800, 800);
}

void draw() {
  fill(255, 100);
  rect(0, 0, width, height);
  
  if (!isReady) {
    elapsedTime = 0;
    
  } else if (elapsedTime < totalDuration) {
    elapsedTime += (ONE_MS / frameRate);
    
  } else {
    elapsedTime = totalDuration;
  }
  
  float rate = getRate(getNormalizedCurrentTime());
  
  x = getNormalizedCurrentTime() * width;
  y = height - rate * height;
   
  x = map(x, 0, width, MARGIN, width - MARGIN);
  y = map(y, height, 0, height - MARGIN, MARGIN);
  
  // Support
  stroke(200);
  line(MARGIN, height - MARGIN, MARGIN, MARGIN);
  line(MARGIN, height - MARGIN, width - MARGIN, height - MARGIN);
  line(width - MARGIN + 100, height - MARGIN, width - MARGIN + 100, MARGIN);
  
  // Graph
  for (float x = 0, len = width - MARGIN * 2; x < len; x++) {
    float _rate = getRate(norm(x, 0, len));
    float _x = x;
    float _y = (height - MARGIN * 2) - _rate * (height - MARGIN * 2);
    
    _x += MARGIN;
    _y += MARGIN;;
    
    stroke(#00ccff);
    point(_x, _y);
  }
  
  // Support
  noStroke();
  fill(#00ccff);
  ellipse(MARGIN, height - MARGIN, radius, radius);
  ellipse(width - MARGIN, MARGIN, radius, radius);
  fill(200);
  ellipse(width - MARGIN + 100, MARGIN, radius, radius);
  ellipse(width - MARGIN + 100, height - MARGIN, radius, radius);
  
  // Mover
  fill(#ffcc00);
  ellipse(x, y, radius, radius);
  ellipse(width - MARGIN + 100, y, radius, radius);
}

void mouseReleased() {
  isReady = true;
  elapsedTime = 0;
  x = y = 0;
}

float getNormalizedCurrentTime() {
  return norm(elapsedTime, 0, totalDuration);
}

float getRate(float val) {
  return pow(val, 4);
  //return 1 - pow(1 - val, 4);
  //return pow(val, 0.5);
}