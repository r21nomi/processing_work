import processing.opengl.*;

PImage img;
int[][] values;
float angle;

void setup() {
  size(displayWidth, displayHeight, OPENGL);
  noFill();
  
  values = new int[width][height];

  img = loadImage("image.jpg");
  img.loadPixels();
  for (int i = 0; i < img.height; i++) {
    for (int j = 0; j < img.width; j++) {
      color pixel = img.pixels[i*img.width + j];
      values[j][i] = int(brightness(pixel));
    }
  }
}

void draw() {
  
  background(0);
  translate(width/2, height/2, 0);
  scale(2.0);
  
  angle += 0.3;
  rotateY(radians(map(mouseX, 0, displayWidth, -60, 60)));
  rotateX(radians(map(mouseY, 0, displayHeight, 40, -40)));
  
  for (int i = 0; i < img.height; i += 3) {
    for (int j = 0; j < img.width; j += 3) {
      stroke(values[j][i], 100);
      float x1 = j-img.width/2;
      float y1 = i-img.height/2;
      float z1 = 0;
      float x2 = x1;
      float y2 = y1;
      float sin = sin(angle * noise(values[j][i]));
      float z2 = values[j][i]/20 * sin;
      line(x1, y1, z1, x2, y2, z2);
    }
  }
}