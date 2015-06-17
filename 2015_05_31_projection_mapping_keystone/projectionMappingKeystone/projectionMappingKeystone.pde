import deadpixel.keystone.*;

Keystone ks;
CornerPinSurface surface;

PGraphics offscreen;
Mover mover;

void setup() {
  size(displayWidth, displayHeight, P3D);
  ks = new Keystone(this);
  surface = ks.createCornerPinSurface(displayWidth,displayHeight, 20);
  offscreen = createGraphics(displayWidth, displayHeight, P3D);
  mover = new Mover(offscreen, 0, 0);
}

void draw() {
  PVector surfaceMouse = surface.getTransformedMouse();

//  offscreen.beginDraw();
//  offscreen.background(255);
//  offscreen.fill(0, 255, 0);
//  offscreen.ellipse(surfaceMouse.x, surfaceMouse.y, 75, 75);
//  offscreen.endDraw();

  mover.update();
  mover.display();
  mover.checkEdges();

  background(0);
 
  surface.render(offscreen);
}

void keyPressed() {
  switch(key) {
  case 'c':
    // enter/leave calibration mode, where surfaces can be warped 
    // and moved
    ks.toggleCalibration();
    break;

  case 'l':
    // loads the saved layout
    ks.load();
    break;

  case 's':
    // saves the layout
    ks.save();
    break;
  }
}

boolean sketchFullScreen() {
  return true;
}
