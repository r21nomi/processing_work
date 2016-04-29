class Anchor {
  
  float x;
  float y;
  float radius;
  boolean isHandlePoint;
  boolean isDragging;
  float offset_x;
  float offset_y;

  Anchor(float x, float y, float radius, boolean isHandlePoint) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.isHandlePoint = isHandlePoint;
    
    float val = 1.3;
    this.offset_x = random(-val, val);
    this.offset_y = random(-val, val);
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
      x = x + offset_x * cos(frameCount * 0.05);
      y = y + offset_y * cos(frameCount * 0.05 * noise(5000));
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
    //noFill();
    fill(155, 0, 145);
    stroke(0);
    strokeWeight(5);
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