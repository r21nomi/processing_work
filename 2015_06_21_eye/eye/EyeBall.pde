class EyeBall {
  
  float radius = 200;
  float dir = 1;
  float val = 0;
  float lastX;
  float lastY;
  float lastZ;
    
  EyeBall() {}
  
  void display() {
    val += 5;
    
    for(int s = 0; s <= 180; s += 10){
      float radianS = s == 0 ? radians(3) : radians(s);
      float expansion = map(sin(radians(val)), -1, 1, 1, 1.5);
      float z = radius * cos(radianS) * expansion;
      
      // Eye
      if (s <= 20) {
        noStroke();
        if (s == 20) {
          fill(255, 255, 255, 180);
        } else if (s == 10) {
          fill(0, 128, 128, 180);
        } else {
          fill(0, 100);
        }
        // Fill eye
        beginShape();
        for (int t = 0; t <= 360; t += 10) {
          float radianT = radians(t);
          float x = radius * sin(radianS) * cos(radianT) * expansion;
          float y = radius * sin(radianS) * sin(radianT) * expansion;
          vertex(x, y, z);
        }
        endShape();
      }
      // Oval
      else {
        for(int t = 0; t <= 360; t += 10){
          float radianT = radians(t);
          float x = radius * sin(radianS) * cos(radianT) * expansion;
          float y = radius * sin(radianS) * sin(radianT) * expansion;
          stroke(0, 128, 128);
          strokeWeight(3);
          point(x, y, z);
          
          // Connect points with line
          if (t != 0) {
            strokeWeight(1);
            line(x, y, z, lastX, lastY, lastZ);
          }
          
          lastX = x;
          lastY = y;
          lastZ = z;
        }
      }
    }
  }
}
