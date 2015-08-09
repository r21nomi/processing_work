/**
 * @See <a href="http://tercel-sakuragaoka.blogspot.jp/2011/06/processingdelaunay.html" />
 */


ArrayList<Point> points = new ArrayList();
DelaunayTriangles mDelaunayTriangles;

void setup() {
  size(displayWidth, displayHeight);
  
  for (int i = 0, len = 10; i < len; i++) {
    points.add(new Point(random(width), random(height)));
  }
  mDelaunayTriangles = new DelaunayTriangles(points);
}

void draw() {
  background(0);
  noFill();
  stroke(255);
  smooth();
  
  mDelaunayTriangles.draw();
}

void mouseReleased() {
  mDelaunayTriangles.addPoint(new Point(mouseX, mouseY));
  mDelaunayTriangles.update();
}
