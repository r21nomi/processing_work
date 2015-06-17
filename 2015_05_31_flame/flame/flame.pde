ParticleSystem mParticleSystem;

void setup() {
  size(displayWidth, displayHeight);
  PImage img = loadImage("texture.png");
  mParticleSystem = new ParticleSystem(img);
}

void draw() {
    background(0);
    mParticleSystem.update();
    mParticleSystem.display();
}
