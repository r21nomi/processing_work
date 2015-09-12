float yoff = 0.0;

void setup() {
  size(displayWidth, displayHeight);
  noStroke();
}

void draw() {
  background(0);
  fill(255);
  
  beginShape();
 
  float xoff = 0;
  //float xoff = yoff;
  for (float x = 0; x <= width; x += 10) {
    float y = map(noise(xoff, yoff), 0, 1, height / 1.2, height / 2);
    vertex(x, y); 
    xoff += 0.005;  // インクリメントする値を大きくすると粗い波になる
  }
  
  yoff += 0.01;  // インクリメントする値を大きくすると波の振動数が早くなる
  
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
}