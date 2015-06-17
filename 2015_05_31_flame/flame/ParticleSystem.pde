import java.util.*;

class ParticleSystem {
  
  List<Particle> mParticles;
  PImage mImg;
  
  ParticleSystem(PImage img) {
    mImg = img;
    mParticles = new ArrayList();
  }
  
  void update() {
    float dist = dist(mouseX, 0, displayWidth/2, 0);
    float dirX = map(mouseX, 0, displayWidth, -10, 10);
    float dirY = map(dist, 0, displayWidth/2, -10, -1);
    PVector location = new PVector(displayWidth/2, displayHeight/2);
    PVector velocity = new PVector(dirX, dirY);
    Particle particle = new Particle(mImg, location, velocity);
    mParticles.add(particle);
  }
  
  void display() {
    Iterator<Particle> it = mParticles.iterator();
    while(it.hasNext()) {
      Particle particle = it.next();
      if (particle.isDead()) {
        it.remove();
      } else {
        particle.update();
        particle.display();
      }
    }
  }
}
