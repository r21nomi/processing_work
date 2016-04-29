class Anchor {
  
  float x;
  float y;
  float radius;
  boolean isHandlePoint;
  boolean isDragging;
  float offset_x;
  float offset_y;
  float theta;

  Anchor(float x, float y, float radius, float offset, float theta, boolean isHandlePoint) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.isHandlePoint = isHandlePoint;
    
    this.offset_x = random(-offset, offset);
    this.offset_y = random(-offset, offset);
    this.theta = theta;
  }
  
  void changeDraggState(float mouse_x, float mouse_y, boolean isMousePressed) {
    if (isMousePressed) {
      if (isInclude(mouse_x, mouse_y)) {
        isDragging = true;
      }
    } else {
      isDragging = false;
    }
  }
  
  void update(float mouse_x, float mouse_y) {
    if (isDragging) {
      x = mouse_x;
      y = mouse_y; 
    }
  }
  
  void update() {
    if (!isDragging) {
      x = x + offset_x * cos(frameCount * theta);
      y = y + offset_y * sin(frameCount * theta) * noise(1);
    }
  }
  
  void setLocation(PVector location) {
    x = location.x;
    y = location.y;
  }
  
  PVector getLocation() {
    return new PVector(x, y);
  }
  
  boolean isInclude(float mouse_x, float mouse_y) {
    return mouse_x > x - radius
        && mouse_x < x + radius
        && mouse_y > y - radius
        && mouse_y < y + radius;
  }
  
  void drawVertex() {
    curveVertex(x, y);
  }
  
  void drawPoint() {
    noStroke();
    if (isHandlePoint) {
      fill(255, 0, 0);
    } else {
      fill(0, 0, 255);
    }
    ellipse(x, y, radius, radius);
  }
}