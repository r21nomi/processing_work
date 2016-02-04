Mover mover;
VectorMover vectorMover;

void setup() {
  size(800, 800);
  
  mover = new Mover(0, 0);
  vectorMover = new VectorMover(0, 0);
}

void draw() {
  noStroke();
  fill(0);
  rect(0, 0, width, height);
  
  mover.update(mouseX, mouseY);
  mover.display();
  
  vectorMover.update(mouseX, mouseY);
  vectorMover.display();
}