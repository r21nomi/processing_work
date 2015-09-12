Mover mover;

void setup() {
  size(displayWidth, displayHeight);
  mover = new Mover();
}

void draw() {
  background(255);
  mover.update();
  mover.check();
  mover.display();
}