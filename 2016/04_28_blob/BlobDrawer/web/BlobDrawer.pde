static final int ITEM_COUNT_ON_LINE = 8;
static final int VERTEX_COUNT = 10;
static final int ITEM_PADDING = 5;
float originX;
float originY;
ArrayList<Blob> blobs = new ArrayList();

void setup() {
  size(800, 500);
  
  originX = width / 2;
  originY = height / 2;
  
  float radius = width / ITEM_COUNT_ON_LINE / 2;
  int vertical_line = (int)(height / (radius * 2));
  
  for (int i = 0, len = ITEM_COUNT_ON_LINE * vertical_line; i < len; i++) {
    Blob blob = new Blob(
      VERTEX_COUNT,
      radius - ITEM_PADDING,
      color(0),
      1.6,
      0.2,
      radius + radius * 2 * (i % ITEM_COUNT_ON_LINE),
      radius + radius * 2 * (int)(i / ITEM_COUNT_ON_LINE)
    );
    blobs.add(blob);
  }
}

void draw() {
  fill(255);
  noStroke();
  rect(0, 0, width, height);
  
  for (Blob blob : blobs) {
    blob.update();
    blob.draw();
  }
}
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
