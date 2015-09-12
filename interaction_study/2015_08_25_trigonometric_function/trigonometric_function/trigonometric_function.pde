float r, theta, accelalationTheta, x, y;

int num;
private ArrayList<Particle> particles;
 
void setup(){
  size(displayWidth, displayHeight);
  r = 200;
  num = 50;
  theta = accelalationTheta = 0.0;
  particles = new ArrayList();
  
  init();
}

void init() {
  float t = 0;
  for (int i = 0, len = 50; i < len; i++) {
    float x = r * cos(t);
    float y = r * sin(t);
    particles.add(new Particle(x, y, 10));
    t += 10 * PI / 180;
  }
}
 
void draw(){
  fill(0);
  rect(0, 0, width, height);
  fill(255);
  
  pushMatrix();
  translate(width / 2, height / 2);
  rotate(theta);
  
  for (Particle p : particles) {
    p.update();
    p.draw();
  }
  
  popMatrix();
  
  accelalationTheta += 1 * PI / 180;
  theta += map(sin(accelalationTheta), -1, 1, 1, 10) * PI / 180;
}