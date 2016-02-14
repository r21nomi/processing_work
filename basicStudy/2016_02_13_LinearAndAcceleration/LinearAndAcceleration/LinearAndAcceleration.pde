float x1 = 15;
float y1 = 50;
float x2 = 15;
float y2 = 100;

float radius = 15.0;
float velocity1 = 11;
float velocity2 = 0;
float friction = 0.99;
float acceleration = 0.32;
boolean canStart = false;

void setup() {
  size(800, 150);
  noStroke();
  ellipseMode(RADIUS);
}

void draw() {
  fill(0);
  rect(0, 0, width, height);
  fill(255);
  
  if (canStart) {
    x1 += velocity1;
    
    velocity2 += acceleration;
    x2 += velocity2;
  }
  
  
  if (x1 > width - radius) {
    x1 = width - radius;
    //velocity = -velocity;
  }
  if (x2 > width - radius) {
    x2 = width - radius;
    //velocity = -velocity;
  }
  
  ellipse(x1, y1, radius, radius);
  ellipse(x2, y2, radius, radius);
}

void keyPressed() {
  switch(key) {
    case ' ':
    canStart = true;
  }
}