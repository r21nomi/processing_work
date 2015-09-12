class Particle {
  PVector location;
  float maxRadius;
  float radius;
  float theta, radiusTheta, accelarationTheta;
  float dir;
  
  Particle(float x, float y, float radius) {
    location = new PVector(x, y);
    this.radius = this.maxRadius = radius;
    this.theta = this.radiusTheta = this.accelarationTheta = 0;
    this.dir = random(-1, 1);
  }
  
  void update() {
    //float r = random(10);
    float x = map(sin(accelarationTheta), -1, 1, 1, 4) * cos(theta);
    float y = map(sin(accelarationTheta), -1, 1, 1, 4) * sin(theta);
    location.x += x;
    location.y += y;
    radius = radius + 1 * dir * sin(radiusTheta);
    theta += 28 * PI / 180 * dir;
    radiusTheta += 10 * PI / 180;
    accelarationTheta += 5 * PI / 180;
  }
  
  void draw() {
    fill(255);
    noStroke();
    ellipse(location.x, location.y, radius, radius);
  }
}