private ArrayList<Particle> particles;

void setup() {
  size(displayWidth, displayHeight);
  background(255);
  
  particles = new ArrayList();
  
  initParticles();
}

void draw() {
  fill(255, 170);
  rect(0, 0, width, height);
  
  for (Particle p : particles) {
    p.draw();
  }
}

private void initParticles() {
  for (int i = 0, len = 50; i < len; i++) {
    particles.add(new Particle(new PVector(random(0, width / 2), random(0, random(0, height))), random(10, 50)));
  }
}