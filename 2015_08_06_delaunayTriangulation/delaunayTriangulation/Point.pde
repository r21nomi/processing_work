class Point extends PVector {
  
  Point(float x, float y) {
    super(x, y);
  }
  
  Point(PVector p) {
    x = p.x;
    y = p.y;
    z = p.z;
  }
  
  public boolean equals(Object o) {
    try {
      PVector p = (PVector)o;
      return x == p.x && y == p.y && z == p.z;
    } catch(Exception e) {
      return false;
    }
  }
  
  public void draw() {
    point(x, y);
  }
}
