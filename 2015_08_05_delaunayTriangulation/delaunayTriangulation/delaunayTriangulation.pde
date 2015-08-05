ArrayList<PVector> points;
float diameter;

void setup() {
  size(displayWidth, displayHeight);
  points = new ArrayList();
  diameter = 10;
}

void draw() {
  background(255);
  
  if (points.size() == 3) {
    float x1 = points.get(0).x;
    float y1 = points.get(0).y;
    float x2 = points.get(1).x;
    float y2 = points.get(1).y;
    float x3 = points.get(2).x;
    float y3 = points.get(2).y;
    float c = 2 * (((x2 - x1) * (y3 - y1)) - (y2 - y1) * (x3 - x1));
    float x = ((y3 - y1) * ((x2 * x2) - (x1 * x1) + (y2 * y2) - (y1 * y1)) + (y1 - y2) * ((x3 * x3) - (x1 * x1) + (y3 * y3) - (y1 * y1))) / c;
    float y = ((x1 - x3) * ((x2 * x2) - (x1 * x1) + (y2 * y2) - (y1 * y1)) + (x2 - x1) * ((x3 * x3) - (x1 * x1) + (y3 * y3) - (y1 * y1))) / c;
    float dia = dist(x, y, x1, y1) * 2;
    
    stroke(0);
    noFill();
    ellipse(x, y, dia, dia);
    
    fill(200);
    noStroke();
    triangle(x1, y1, x2, y2, x3, y3);
  } else {
    fill(0);
    noStroke();
    
    for (PVector p : points) {
      ellipse(p.x, p.y, diameter, diameter);
    }
  }
}

void mouseReleased() {
  if (points.size() >= 3) {
    points.clear();
  }
  points.add(new PVector(mouseX, mouseY));
}
