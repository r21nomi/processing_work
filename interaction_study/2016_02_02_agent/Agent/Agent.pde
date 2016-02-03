Rider rider;

void setup() {
  size(800, 800);
  
  rider = new Rider(width / 2, height / 2);
}

void draw() {
  noStroke();
  fill(0, 20);
  rect(0, 0, width, height);
  
  fill(255);
  rider.update();
  rider.check();
  rider.display();
}