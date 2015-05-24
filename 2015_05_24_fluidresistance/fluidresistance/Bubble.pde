import java.util.*;

class Bubble {
  
  PVector velocity;
  PVector location;
  ArrayList<BubbleBall> bubbles;
  Mover mover;
  float mass;
  
  Bubble(Mover m) {
    mover = m;
    velocity = new PVector(0, 0);
    bubbles = new ArrayList<BubbleBall>();
    mass = m.mass * 8;
  }
  
  void update() {
    mass -= 0.5;
    if (mass < 0) {
     mass = 0;
    }
    BubbleBall ball = new BubbleBall(mass, mover.location.x + random(-10, 10), mover.location.y + random(-5, 5));
    bubbles.add(ball);
  }
  
  void display() {
    Iterator<BubbleBall> it = bubbles.iterator();
    while(it.hasNext()) {
      BubbleBall ball = it.next();
      if (ball.isDead()) {
        it.remove();
      } else {
        ball.update();
        ball.display();
      }
    }
  }
}