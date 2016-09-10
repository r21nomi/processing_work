int maxCount = 5000; //max count of the cirlces
int currentCount = 1;
float[] x = new float[maxCount];
float[] y = new float[maxCount];
float[] r = new float[maxCount]; //radius
int[] closestIndex = new int[maxCount]; //index

float minRadius = 3;
float maxRadius = 200;

void setup() {
  size(800,800);
  noFill();
  smooth();
  cursor(CROSS);

  // first circle
  x[0] = 200;
  y[0] = 100;
  r[0] = 50;
  closestIndex[0] = 0;
    
    for (int k = 0; k < 3000; k++) {
      float newX = random(0 + maxRadius, width - maxRadius);
      float newY = random(0 + maxRadius, height - maxRadius);
      float newR = minRadius;
    
      boolean intersection = false;
    
      // find out, if new circle intersects with one of the others
      for (int j = 0; j < currentCount; j++) {
        float d = dist(newX, newY, x[j], y[j]);
        if (d < (newR + r[j])) {
          intersection = true; 
          break;
        }
      }
    
      // no intersection ... add a new circle
      if (intersection == false) {
        float newRadius = width;
        for (int i=0; i < currentCount; i++) {
          float d = dist(newX, newY, x[i], y[i]);
          if (newRadius > d - r[i]) {
            newRadius = d - r[i];
            closestIndex[currentCount] = i;
          }
        }
    
        if (newRadius > maxRadius) newRadius = maxRadius;
        
        x[currentCount] = newX;
        y[currentCount] = newY;
        r[currentCount] = newRadius;
        currentCount++;
     }
  }
}



void draw() {
  background(255);

  for (int i = 0 ; i < currentCount; i++) {
    stroke(0);
    strokeWeight(1.5);
    ellipse(x[i], y[i], r[i] * 2, r[i] * 2);
  }
}