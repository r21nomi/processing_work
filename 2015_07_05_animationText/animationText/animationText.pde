import antlr.collections.List;

color BACKGROUND_COLOR = color(255);
color PGRAPHICS_COLOR = color(0);
ArrayList<Particle> particles = new ArrayList();
String text = "proce55ing";
int gridX = 80;
int gridY = 50; 

PGraphics pg;

void setup() {
  size(displayWidth, displayHeight);
  background(BACKGROUND_COLOR);
  colorMode(HSB, 360, 100, 100); // change to Hue-Saturation-Brightness color mode
  rectMode(CENTER);
  
  float textSize = map(width / text.length(), width, width / 8, 800, 250);

  pg = createGraphics(width, height, JAVA2D);
  pg.beginDraw();
  pg.textSize(textSize);
  pg.textAlign(CENTER, CENTER);
  pg.fill(PGRAPHICS_COLOR);
  pg.text(text, pg.width/2, pg.height/2); 
  pg.endDraw();
  
  gridX = (int)map(pg.textSize, 800, 250, 200, 200);
  gridY = (int)map(pg.textSize, 800, 250, 150, 150);
  
  initParticles();
}

void initParticles() {
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
        stroke(0, 100);
        strokeWeight(1);
        line(baseLocation.x, baseLocation.y, targetLocation.x, targetLocation.y);
      }
    }
  }
}
