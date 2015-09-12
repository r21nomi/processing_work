float yoff = 0.0;
float velocity = 160;

void setup() {
  size(displayWidth, displayHeight);
  noStroke();
}

void draw() {
  background(0);
  fill(255);
  
  beginShape();
  
  velocity = map(mouseX, 0, width, 150, 300);
 
  float xoff = 0;
  //float xoff = yoff;
  for (float x = 0; x <= width; x += 1) {
    float y;
    if ((x >= mouseX - velocity && x < mouseX)) {
      y = map(noise(xoff, yoff), 0, 1, height / 1.2, height / 2) - map(x - mouseX, -velocity, 0, 0, (height - mouseY) / 4);
    } else if ((x >= mouseX && x < mouseX + velocity)) {
      y = map(noise(xoff, yoff), 0, 1, height / 1.2, height / 2) - map(x - mouseX, 0, velocity, (height - mouseY) / 4, 0);
    } else {
      y = map(noise(xoff, yoff), 0, 1, height / 1.2, height / 2);
    }
    vertex(x, y); 
    xoff += 0.005;  // インクリメントする値を大きくすると粗い波になる
  }
  
  yoff += 0.01;  // インクリメントする値を大きくすると波の振動数が早くなる
  
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
}