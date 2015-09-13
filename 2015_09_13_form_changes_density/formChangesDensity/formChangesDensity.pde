/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/100821*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */

float xn, yn, zn;
float xstart;
long n;

void setup() {
  size(500, 500);
  smooth();
  noStroke();
  noCursor();
  rectMode(CENTER);
  n = (long)random(10000);
}

void draw() {
  background(0);
  noiseSeed(n);
  
  yn = noise(n);  // ynはここでリセット
  zn += 0.03;  // znはリセットしない
  
  for (int i = 0; i <= width / 10; i++) {
    xn = noise(n);  // ここでxnをリセットすることでまとまりがでる
    yn += 0.02;
    
    for (int j = 0; j <= height/10; j++) {
      xn += 0.02;
      float rs = noise(xn, yn, zn) * 15;
      fill(255, 0, 0);
      rect(i * 10 + 5, j * 10 + 5, rs, rs);
    }
  }
}