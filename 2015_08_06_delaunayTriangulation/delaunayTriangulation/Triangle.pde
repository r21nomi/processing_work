class Triangle {
  
  public Point p1;
  public Point p2;
  public Point p3;
  
  Triangle(Point p1, Point p2, Point p3) {
    this.p1 = p1;
    this.p2 = p2;
    this.p3 = p3;
  }
  
  // equalsメソッドをオーバーライドしたのでhashCodeメソッドもオーバーライドしなければならない
  public int hashCode() {  
    return 0;  
  } 
  
  public boolean equals(Object o) {
    try {
      Triangle t = (Triangle)o;
      return p1.equals(t.p1) && p2.equals(t.p2) && p3.equals(t.p3)
        || p1.equals(t.p2) && p2.equals(t.p3) && p3.equals(t.p1)
        || p1.equals(t.p3) && p2.equals(t.p1) && p3.equals(t.p2)
        || p1.equals(t.p1) && p2.equals(t.p3) && p3.equals(t.p2)
        || p1.equals(t.p2) && p2.equals(t.p1) && p3.equals(t.p3)
        || p1.equals(t.p3) && p2.equals(t.p2) && p3.equals(t.p1);
    } catch(Exception e) {
      return false;
    }
  }
  
  public boolean hasCommonPoints(Triangle t) {
    return p1.equals(t.p1) || p1.equals(t.p2) || p1.equals(t.p3)
      || p2.equals(t.p1) || p2.equals(t.p2) || p2.equals(t.p3)
      || p3.equals(t.p1) || p3.equals(t.p2) || p3.equals(t.p3);
  }
  
  public void draw() {
    triangle(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y);
  }
}
