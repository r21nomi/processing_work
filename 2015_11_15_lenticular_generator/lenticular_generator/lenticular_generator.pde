ArrayList<PImage> images = new ArrayList();
ArrayList<int[][]> valueList = new ArrayList();
int ORIGIN_LINE_WIDTH = 1;
int lineWidth = 0;
int distance = 0;

void setup() {
  size(displayWidth, displayHeight);
  noFill();
  
  images.add(loadImage("image.jpg"));
  images.add(loadImage("image_3.jpg"));
  images.add(loadImage("image_2.jpg"));
  
  for (PImage image : images) {
    image.loadPixels();
    
    int[][] values = new int[width][height];
    
    for (int i = 0; i < image.height; i++) {
      for (int j = 0; j < image.width; j++) {
        color pixel = image.pixels[i*image.width + j];
        values[j][i] = int(pixel);
      }
    }
    
    valueList.add(values);
  }
  
  lineWidth = ORIGIN_LINE_WIDTH * (images.size() - 1);
}

void draw() {
  background(0);
  //translate(width/2, height/2);
  
  for (int imageCount = 0, len = images.size(); imageCount < len; imageCount++) {
    PImage image = images.get(imageCount);
    
    for (int i = 0; i < image.height; i += 1) {
      for (int j = 0; j < image.width; j += 1) {
        if (j % lineWidth == 0) {
          distance = j + (lineWidth * j / lineWidth);
        }
        float x1 = j + distance + imageCount * lineWidth;
        //float y1 = i + imageCount * 100;
        float y1 = i;
        stroke(valueList.get(imageCount)[j][i], 255);
        point(x1, y1);
      }
    }
  }
}