float originX;
float originY;
static final int ITEM_COUNT = 40;
static final int VERTEX_COUNT = 10;

ArrayList<Blob> blobs = new ArrayList();

void setup() {
  size(displayWidth, displayHeight);
  
  originX = width / 2;
  originY = height / 2;
  
  float radius = 100;
  int line = (int)(width / (radius * 2));
  
  for (int i = 0; i < ITEM_COUNT; i++) {
    Blob blob = new Blob(
      VERTEX_COUNT,
      radius,
      color(155, 0, 145),
      1.6,
      0.2,
      radius + radius * 2 * (i % line),
      radius + radius * 2 * (i / line)
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