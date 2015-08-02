ArrayList<Particle> particle;
int num = 1;

void setup() {
  size(displayWidth, displayHeight);
  particle = new ArrayList();
  
  for (int i = 0, len = num; i < len; i++) {
    particle.add(new Particle(new PVector(random(width), random(width))));
  }
}

void draw() {
  background(0);
  for (int i = 0, len = num; i < len; i++) {
    particle.get(i).update();
    particle.get(i).draw();
  }
}

void mouseReleased() {
  for (int i = 0, len = num; i < len; i++) {
    particle.get(i).setDestination(new PVector(mouseX, mouseY));
  }
}
