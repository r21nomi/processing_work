/**
 * https://www.processing.org/reference/bezier_.html
 */

int startX = 0;
int startY = 0;
int startHandleX = 100;
int startHandleY = 50;
int endX = 0;
int endY = 100;
int endHandleX = 100;
int endHandleY = 50;

void setup() {
  size(displayWidth, displayHeight);
  noFill();
}

void draw() {
  fill(255);
  rect(0, 0, width, height);
  
  noFill();
  translate(width / 2, height / 2);
  
  // axis line (x, y)
  stroke(240, 240, 240);
  line(-width / 2, 0, width / 2, 0);
  line(0, -height / 2, 0, height / 2);
  
  // curve
  stroke(0, 0, 0);
  bezier(startX, startY,
         startHandleX, startHandleY,
         endHandleX, endHandleY,
         endX, endY);
  
  // auxiliary line
  stroke(255, 102, 0);
  line(startX, startY, startHandleX, startHandleY);
  line(endX, endY, endHandleX, endHandleY);
  
  // point
  noStroke();
  fill(#ff0000);
  ellipse(startX, startY, 5, 5);
  fill(#0000ff);
  ellipse(endX, endY, 5, 5);
}