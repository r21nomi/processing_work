private int gap = 20;
private int thickness = 2;

void setup() {
  size(500, 500);
  noFill();
  strokeWeight(thickness);
  stroke(0);
}

void draw() {
  background(255);
  pushMatrix();
  translate(width / 2, height / 2);
  rotate(6.0 * cos(radians(frameCount)));
  
  for (int i = 0; i < height; i += gap) {
    float angle = radians(i);
    float arcLength = map(sin(radians(frameCount * i) / 85), -1, 1, 0, 6.3);
    arc(0, 0, i, i, angle, angle + arcLength);
  }
  
  popMatrix();
}