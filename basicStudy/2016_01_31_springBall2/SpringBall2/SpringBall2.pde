ArrayList<FixedSpring> springs = new ArrayList();
float mass = 2.0;
float gravity = 5.0;

void setup() {
  size(800, 800);
  
  for (int i = 0; i < 10; i++) {
    FixedSpring spring = new FixedSpring(width / 2, i * (height / 10), mass, gravity, 10);
    springs.add(spring);
  }
}

void draw() {
  fill(200, 255);
  rect(0, 0, width, height);
  
  fill(255);
  
  for (int i = 0, len = springs.size(); i < len; i++) {
    Spring2D spring = springs.get(i);
    
    if (i == 0) {
      spring.update(mouseX, mouseY);
      spring.display(mouseX, mouseY);
      
    } else {
      Spring2D exSpring = springs.get(i - 1);
      spring.update(exSpring.x, exSpring.y);
      spring.display(exSpring.x, exSpring.y);
    }
  }
}