private static final int TEXT_SIZE = 20;
private int mAlpha;
private AlphabetRenderer mAlphabetRenderer;

void setup() {
  fullScreen();
  textAlign(CENTER, CENTER);
  textSize(TEXT_SIZE);
  
  mAlpha = 20;
  mAlphabetRenderer = new AlphabetRenderer(TEXT_SIZE);
}

void draw() {
  fill(255, mAlpha);
  rect(0, 0, width, height);
  fill(100);
  
  mAlphabetRenderer.update();
  mAlphabetRenderer.display();
}