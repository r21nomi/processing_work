float start_x = -100;
float start_y = 0;
float end_x = 100;
float end_y = 100;

float first_x = 0;
float first_y = 0;
float second_x = 300;
float second_y = 0;
float third_x = 150;
float third_y = 300;
float fourth_x = 0;
float fourth_y = 300;
float fifth_x = -300;
float fifth_y = -300;

float radius = 10;
float originX;
float originY;
boolean isDraggableStartHandle;
boolean isDraggableEndHandle;

void setup() {
 size(displayWidth, displayHeight);
  
 originX = width / 2;
 originY = height / 2;
}

void draw() {
 fill(255);
 noStroke();
 rect(0, 0, width, height);
  
 noFill();
 strokeWeight(2);
  
 translate(originX, originY);
  
 // Auxiliary line
 stroke(220);
 line(start_x, start_y, first_x, first_y);
 line(end_x, end_y, third_x, third_y);
  
 // Shape
 stroke(0);
 beginShape();
 curveVertex(start_x, start_y);
  
 // These are only drawed as curve
 curveVertex(first_x, first_y);
 curveVertex(second_x, second_y);
 curveVertex(third_x, third_y);
  
 curveVertex(end_x, end_y);
 endShape();
  
 color handleColor = color(255, 0, 0);
 color drawingColor = color(0, 0, 255);
 noStroke();
  
 // Start handle point
 fill(handleColor);
 ellipse(start_x, start_y, radius, radius);
  
 // Drawing point (curve is drawn detween these points)
 fill(drawingColor);
 ellipse(first_x, first_y, radius, radius);
 ellipse(second_x, second_y, radius, radius);
 ellipse(third_x, third_y, radius, radius);
  
 // End handle point
 fill(handleColor);
 ellipse(end_x, end_y, radius, radius);
}

void mousePressed() {
 float _mouseX = getCalcuratedMouseX();
 float _mouseY = getCalcuratedMouseY();
  
 if (_mouseX > start_x - radius
     && _mouseX < start_x + radius
     && _mouseY > start_y - radius
     && _mouseY < start_y + radius) {
   isDraggableStartHandle = true;
 } else {
   isDraggableStartHandle = false;
 }
  
 if (_mouseX > end_x - radius
     && _mouseX < end_x + radius
     && _mouseY > end_y - radius
     && _mouseY < end_y + radius) {
   isDraggableEndHandle = true;
 } else {
   isDraggableEndHandle = false;
 }
}

void mouseDragged() {
 if (isDraggableStartHandle) {
   start_x = getCalcuratedMouseX();
   start_y = getCalcuratedMouseY();
 }
 if (isDraggableEndHandle) {
   end_x = getCalcuratedMouseX();
   end_y = getCalcuratedMouseY();
 }
}

void mouseReleased() {
 isDraggableStartHandle = false;
 isDraggableEndHandle = false;
}

float getCalcuratedMouseX() {
 return mouseX - originX;
}

float getCalcuratedMouseY() {
 return mouseY - originY;
}