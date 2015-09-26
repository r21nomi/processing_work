color BACKGROUND_COLOR = color(0);
color PGRAPHICS_COLOR = color(255);
ArrayList<Particle> particles;
String source = "";
int gridX = 80;
int gridY = 50;

PGraphics pg;

void setup() {
  size(displayWidth, displayHeight);
  background(BACKGROUND_COLOR);
  rectMode(CENTER);
  
  initPGraphics();
  initParticles();
}

void initPGraphics() {
  float size = source.length() != 0 ? width / source.length() : width;
  float textSize = map(size, width, width / 8, 800, 250);

  pg = createGraphics(width, height, JAVA2D);
  pg.beginDraw();
  pg.textSize(textSize);
  pg.textAlign(CENTER, CENTER);
  pg.fill(PGRAPHICS_COLOR);
  pg.text(source, pg.width/2, pg.height/2); 
  pg.endDraw();
  
  gridX = (int)map(pg.textSize, 800, 250, 200, 200);
  gridY = (int)map(pg.textSize, 800, 250, 150, 150);
}

void initParticles() {
  particles = new ArrayList();
  float w = float(width) / gridX;
  float h = float(height) / gridY;
  
  for (int y = 0; y < gridY; y++) {
    for (int x = 0; x < gridX; x++) {
      float vx = w * x;
      float vy = h * y;
       
      if (isInsideText((int)vx, (int)vy)) {
        Particle particle = new Particle(new PVector(vx, vy));
        particle.display();
        particles.add(particle);
      }
    }
  }
}

boolean isInsideText(int x, int y) {
  return (pg.get(x, y) == PGRAPHICS_COLOR);
}

void draw() {
  background(BACKGROUND_COLOR);
  
  for (int i = 0, len = particles.size(); i < len; i++) {
    Particle baseParticle = particles.get(i);
    PVector baseLocation = baseParticle.getLocation();
    
    if (!isInsideText((int)baseLocation.x, (int)baseLocation.y)) {
      baseParticle.updateDir(-1, -1);
    }
    baseParticle.update();
    baseParticle.display();
    
    for (int k = i+1; k < particles.size(); k++) {
      Particle targetParticle = particles.get(k);
      PVector targetLocation = targetParticle.getLocation();
      float dist = baseLocation.dist(targetLocation);
      
      if (dist != 0 && dist < 10) {
        stroke(255, 100);
        strokeWeight(1);
        line(baseLocation.x, baseLocation.y, targetLocation.x, targetLocation.y);
      }
    }
  }
}

void keyPressed() {  
  if(key == BACKSPACE) {
    if(source.length() > 0) {
      source = source.substring(0, source.length() - 1);
    }
  } else {
    source += key;
  }
  initPGraphics();
  initParticles();
}