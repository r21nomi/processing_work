private static final float STEP = 8;
private PImage mImage;
private ArrayList<Dot> mDots = new ArrayList();

void setup() {
  size(displayWidth, displayHeight);
  noFill();
  
  init();
}

void draw() {
  fill(255);
  noStroke();
  rect(0, 0, width, height);
  
  translate(width / 2, height / 2);

  for (Dot dot : mDots) {
    dot.update();
    dot.display();
  }
}

private void init() {
  mImage = loadImage("image.jpg");
  
  for (int i = 0; i < mImage.height; i += STEP) {
    for (int j = 0; j < mImage.width; j += STEP) {
      color col = mImage.pixels[i * mImage.width + j];
      float radius = random(5, 15);
      
      mDots.add(new Dot(new PVector(j - mImage.width / 2, i - mImage.height / 2), col, radius));
    }
  }
}