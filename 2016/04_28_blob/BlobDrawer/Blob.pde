class Blob {
  
  ArrayList<Anchor> anchors = new ArrayList();
  float radius;
  int vertexCount;
  color col;
  float originX;
  float originY;

  Blob(int vertexCount,
       float radius,
       color col,
       float offset,
       float theta,
       float originX,
       float originY) {
    this.vertexCount = vertexCount;
    this.radius = radius;
    this.col = col;
    this.originX = originX;
    this.originY = originY;
    
    // Layout vertex in a circular pattern.
    float step = 360 / vertexCount;
    for (int i = 0, len = 360 + (int)(step * 3); i < len; i += step) {
      boolean isHandlePoint = (i == 0 || i == len - step);
      
      anchors.add(new Anchor(radius * cos(radians(i)), radius * sin(radians(i)), 10, offset, theta, isHandlePoint));
    }
  }
  
  void update() {
    for (int i = 0, len = anchors.size(); i < len; i++) {
      Anchor anchor = anchors.get(i);
      if (i == len - 2) {
        // Connect last point to first point.
        anchor.setLocation(anchors.get(1).getLocation());
      } else {
        anchor.update();
      }
    }
  }
  
  void draw() {
    fill(col);
    noStroke();;
    pushMatrix();
    
    translate(originX, originY);
    
    rotate(radians(frameCount * 2));
    
    // Shape
    beginShape();
    for (Anchor anchor : anchors) {
      anchor.drawVertex();
    }
    endShape();
    
    popMatrix();
  }
}