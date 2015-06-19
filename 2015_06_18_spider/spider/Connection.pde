class Connection {
  Particle p1;
  Particle p2;
  
  Connection(Particle p1, Particle p2) {
    this.p1 = p1;
    this.p2 = p2;
  }
  
  void display() {
    stroke(100);
    line(p1.getLocation().x, p1.getLocation().y, p2.getLocation().x, p2.getLocation().y);
  }
}
