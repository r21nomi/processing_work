class GenParticle extends Particle {
  float originX, originY;
  float friction;
  
  GenParticle(float posX, float posY, float velX, float velY, float r, float ox, float oy) {
    super(posX, posY, velX, velY, r);
    
    originX = ox;
    originY = oy;
    friction = 0.98;
  }
  
  void update() {
    vx *= friction;
    vy *= friction;
    super.update();
  }
  
  void regenerate() {
    if ((x > width - radius) || (x < radius)) {
      vx = -vx;
      x = constrain(x, radius, width - radius);
    }
    if (y > height - radius) {
      vy = -vy;
      y = height - radius;
    }
  }
}