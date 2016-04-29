static final int ITEM_COUNT_ON_LINE = 8;
static final int VERTEX_COUNT = 10;
float originX;
float originY;
ArrayList<Blob> blobs = new ArrayList();

void setup() {
  size(displayWidth, displayHeight);
  
  originX = width / 2;
  originY = height / 2;
  
  float radius = width / ITEM_COUNT_ON_LINE / 2;
  int vertical_line = (int)(height / (radius * 2));
  
  for (int i = 0, len = ITEM_COUNT_ON_LINE * vertical_line; i < len; i++) {
    Blob blob = new Blob(
      VERTEX_COUNT,
      radius,
      color(0),
      1.6,
      0.2,
      radius + radius * 2 * (i % ITEM_COUNT_ON_LINE),
      radius + radius * 2 * (i / ITEM_COUNT_ON_LINE)
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