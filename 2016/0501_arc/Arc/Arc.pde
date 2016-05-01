ArrayList<Particle> particles = new ArrayList();
float radius = 300;
float ms = 0;
float currentMS = 0;
float duration = 1000;

void setup() {
  size(displayWidth, displayHeight);
  frameRate(60);
  noStroke();
  
  ms = 1000 / frameRate;
  
  for (int i = 0, len = 360; i < len; i += 36) {
    Particle particle = new Particle(
                              radius * cos(radians(i)),
                              radius * sin(radians(i)),
                              60,
                              i,
                              i == 0);
    particles.add(particle);
  }
}

void draw() {
  fill(255);
  rect(0, 0, width, height);
  
  //currentMS += ms;
  
  //float offset = currentMS < duration ? map(currentMS, 0, duration, 0, 1) : 1;
  
  //translate(width / 2 * easeInExpo(offset), height / 2);
  translate(width / 2, height / 2);
  rotate(radians(-90));
  
  for (Particle particle : particles) {
    particle.update(radius);
    particle.draw();
  }
}