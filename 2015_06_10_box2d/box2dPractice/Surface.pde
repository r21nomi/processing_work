class Surface {
  
  ArrayList<Vec2> surface;
  
  Surface() {
    surface = new ArrayList<Vec2>();
    
    float theta = 0;
    for (int x = 0, len = width; x < len; x+=10) {
//      float y = map(sin(theta), -1, 1, 100, height - 100);
      float y = map(noise(theta), 0, 1, 300, 600);
      theta += 0.05;
      surface.add(new Vec2(x, y));
    }
//    surface.add(new Vec2(0, height/2+50));
//    surface.add(new Vec2(width/2, height - 100));
//    surface.add(new Vec2(width, height/2));
    
    ChainShape chain = new ChainShape();
    
    Vec2[] vertices = new Vec2[surface.size()];
    
    for (int i = 0, len = vertices.length; i < len; i++) {
      vertices[i] = box2d.coordPixelsToWorld(surface.get(i));
    }
    
    chain.createChain(vertices, vertices.length);
    
    BodyDef bd = new BodyDef();
    Body body = box2d.world.createBody(bd);
    body.createFixture(chain, 1);
  }
  
  void display() {
    strokeWeight(1);
    stroke(0);
    noFill();
    beginShape();
    for (Vec2 v : surface) {
      vertex(v.x, v.y);
    }
    endShape();
  }
}
