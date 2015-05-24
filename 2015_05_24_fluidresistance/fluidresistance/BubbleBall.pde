class BubbleBall {
  
  PVector location;
  float fade = 200;
  int size = 6;
  float degree;
  float diameter;
  
  BubbleBall(float d, float x, float y) {
    location = new PVector(x, y);
    diameter = d;
  }
  
  void update() {
    fade -= 3;
    diameter -= 0.2;
    if (diameter < 1) {
      diameter = 1;
    }
     degree += 10;
  }
  
  void display() {
    noStroke();
    fill(color(255, 255, 255), fade);
    float rad = degree * PI / 180;
    ellipse(location.x + 4 * cos(rad), location.y - degree/10, diameter, diameter); 
  }
  
  boolean isDead() {
    return fade < 0;
  }
}