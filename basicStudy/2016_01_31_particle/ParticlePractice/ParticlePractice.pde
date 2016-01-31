ArrayList<GenParticle> particles = new ArrayList();
static final int COUNT = 400;

void setup() {
  size(800, 800);
  
  for (int i = 0; i < COUNT; i++) {
    float velX = random(-10, 10);
    float velY = -i;
    GenParticle particle = new GenParticle(width / 2,
                                           height / 2,
                                           velX,
                                           velY,
                                           10,
                                           width / 2,
                                           height / 2);
    particles.add(particle);
  }
}

void draw() {
  noStroke();
  fill(0, 30);
  rect(0, 0, width, height);
  
  fill(255);
  
  for (GenParticle p : particles) {
    p.update();
    p.regenerate();
    p.display();
  }
}