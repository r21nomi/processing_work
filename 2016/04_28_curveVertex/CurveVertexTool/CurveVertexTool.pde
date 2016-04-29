float originX;
float originY;
ArrayList<Anchor> anchors = new ArrayList();

void setup() {
  size(displayWidth, displayHeight);
  
  originX = width / 2;
  originY = height / 2;
  
  for (int i = 0, len = 5; i < len; i++) {
    boolean isHandlePoint = (i == 0 || i == len - 1);
    float x = random(-displayWidth / 4, displayWidth / 4);
    float y = random(-displayHeight / 4, displayHeight / 4);
    anchors.add(new Anchor(x, y, 10, isHandlePoint));
  }
}

void draw() {
  fill(255);
  noStroke();
  rect(0, 0, width, height);
  
  translate(originX, originY);
  
  // Auxiliary line
  if (anchors.size() > 3) {
    stroke(230);
    strokeWeight(2);
    PVector startHandle = anchors.get(0).getLocation();
    PVector firstPoint = anchors.get(1).getLocation();
    PVector endHandle = anchors.get(anchors.size() - 1).getLocation();
    PVector secondPoint = anchors.get(anchors.size() - 2).getLocation();
    line(startHandle.x, startHandle.y, firstPoint.x, firstPoint.y);
    line(endHandle.x, endHandle.y, secondPoint.x, secondPoint.y);
  }
  
  // Shape
  beginShape();
  for (Anchor anchor : anchors) {
    anchor.drawVertex();
  }
  endShape();
  
  // Point
  for (Anchor anchor : anchors) {
    anchor.drawPoint();
  }
}

void mousePressed() {
  for (Anchor anchor : anchors) {
    anchor.changeDraggState(getCalcuratedMouseX(), getCalcuratedMouseY(), true);
  }
}

void mouseDragged() {
  for (Anchor anchor : anchors) {
    anchor.update(getCalcuratedMouseX(), getCalcuratedMouseY());
  }
}

void mouseReleased() {
  for (Anchor anchor : anchors) {
    anchor.changeDraggState(getCalcuratedMouseX(), getCalcuratedMouseY(), false);
  }
}

void mouseClicked() {
  float _mouseX = getCalcuratedMouseX();
  float _mouseY = getCalcuratedMouseY();
  
  for (Anchor anchor : anchors) {
    if (anchor.isInclude(_mouseX, _mouseY)) {
      return;
    }
  }
  addAnchor(_mouseX, _mouseY);
}

void addAnchor(float x, float y) {
  anchors.add(anchors.size() - 2, new Anchor(x, y, 10, false));
}

float getCalcuratedMouseX() {
  return mouseX - originX;
}

float getCalcuratedMouseY() {
  return mouseY - originY;
}