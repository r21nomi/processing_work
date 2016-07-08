static final int ITEM_COUNT_ON_LINE = 16;
static final int VERTEX_COUNT = 10;
static final int ITEM_PADDING = 5;
float originX;
float originY;
ArrayList<Cell> cells = new ArrayList();
PGraphics mPg;
PGraphics mMask;

void setup() {
  size(displayWidth, displayHeight);

  mPg = createGraphics(width, height);
  mMask = createGraphics(width, height);

  originX = width / 2;
  originY = height / 2;

  float radius = width / ITEM_COUNT_ON_LINE / 2;
  int vertical_line = (int)(height / (radius * 2));

  for (int i = 0, len = ITEM_COUNT_ON_LINE * vertical_line; i < len; i++) {
    Cell cell = new Blob(
      VERTEX_COUNT,
      radius - ITEM_PADDING,
      color(0, 150),
      1.6,
      0.2,
      radius + radius * 2 * (i % ITEM_COUNT_ON_LINE),
      radius + radius * 2 * (i / ITEM_COUNT_ON_LINE)
    );
    cells.add(cell);
  }
}

void draw() {
  fill(255);
  noStroke();
  rect(0, 0, width, height);

  drawWithMask();
}

void drawWithMask() {
  mPg.beginDraw();
  mPg.smooth();
  // Background color of mask.
  mPg.background(255);

  for (Cell cell : cells) {
    cell.update();
    cell.draw(mPg);
  }

  mPg.endDraw();

  mMask.beginDraw();
  mMask.smooth();
  // If this value is raised, the graphics outside the mask will be shown.
  mMask.background(0);
  mMask.noStroke();
  // If this value is down, the graphics inside the mask will be fade out.
  mMask.fill(255);
  mMask.pushMatrix();
  mMask.translate(width / 2, height / 1.8);

  // mMask.rotate(radians(sin(frameCount * 0.07) * 360));

  int w = height / 2 - 100;
  mMask.triangle(-w * sin(radians(60)), w * cos(radians(60)), 0, -w, w * sin(radians(60)), w * cos(radians(60)));
  mMask.endDraw();
  mMask.popMatrix();

  mPg.mask(mMask);
  image(mPg, 0, 0);
}
