import org.jbox2d.common.Vec2;
import org.jbox2d.dynamics.FixtureDef;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.dynamics.Body;
import org.jbox2d.dynamics.BodyDef;
import shiffman.box2d.Box2DProcessing;
import org.jbox2d.dynamics.*;

ArrayList<Box> items;
Box2DProcessing box2d;
Boundary boundary1;
Surface surface;
 
void setup() {
  size(displayWidth, displayHeight);
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  items = new ArrayList<Box>();
//  boundary1 = new Boundary(300, height - 300, 300, 10);
  surface = new Surface();
}

void draw() {
  background(90);
  if (mousePressed) {
    items.add(new Box(mouseX, mouseY));
  }
  
  for (Box b : items) {
    b.display();
  }
//  boundary1.display();
  surface.display();
  
  box2d.step();
}
