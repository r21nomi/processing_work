static final int RIDER_COUNT = 60;
ArrayList<Rider> riders = new ArrayList();
float alpha = 10;

void setup() {
  background(0);
  size(800, 800);
  
  for (int i = 0; i < RIDER_COUNT; i++) {
    Rider rider = new Rider(width / 2, height / 2, random(4, 8));
    riders.add(rider);
  }
}

void draw() {
  noStroke();
  fill(0, alpha);
  rect(0, 0, width, height);
  
  fill(255);
  
  for (Rider rider : riders) {
    rider.update();
    rider.check();
    rider.display(); 
  }
  
  println("color : " + get(mouseX, mouseY));
}