EyeBall eyeBall;

void setup(){
  size(displayWidth, displayHeight, P3D);
  eyeBall = new EyeBall();
}

void draw(){
  background(0);
  
  translate(width/2, height/2, 0);
  rotateX(getRotateX());
  rotateY(getRotateY());
  rotateZ(frameCount * 0.005);
  
  eyeBall.display();
}

float getRotateY() {
  return radians(map(mouseX, 0, width, -1, 1) * 90);
}

float getRotateX() {
  return radians(map(mouseY, 0, height, -1, 1) * 90) * -1;
}
