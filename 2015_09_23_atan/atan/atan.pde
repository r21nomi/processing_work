private ArrayList<Triangle> mTriangles;
private int mTriangleWidth;
private int mTriangleHeight;
private int mMargin;

void setup() {
  size(displayWidth, displayHeight);
  
  init();
}

void draw() {
  background(255);
  
  for (Triangle triangle : mTriangles) {
    PVector location = triangle.getLocation();
    if (dist(location.x, location.y, mouseX, mouseY) < 160) {
      triangle.changeThickness(160);
    } else {
      triangle.changeThickness(100);
    }
    triangle.update(mouseX, mouseY);
    triangle.draw();
  }
}

void init() {
  mTriangles = new ArrayList();
  mTriangleWidth = 10;
  mTriangleHeight = 15;
  mMargin = 10;
  
  for (int i = 0, wLen = width / (mTriangleHeight + mMargin); i < wLen; i++) {
    for (int j = 0, hLen = height / (mTriangleWidth + mMargin); j < hLen; j++) {
      Triangle triangle = new Triangle(new PVector(i * (mTriangleHeight + mMargin), j * (mTriangleWidth + mMargin)), mTriangleWidth, mTriangleHeight);
      mTriangles.add(triangle);
    }
  }
}