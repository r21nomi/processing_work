class Line {
  PVector start;
  PVector end;
  float alpha;
  
  Line(PVector start, PVector end) {
    this.start = start;
    this.end = end;
    alpha = 255;
  }
  
  void updateAndDraw() {
    strokeWeight(8);
    stroke(255, alpha);
    if (alpha > 0) alpha -= 10;
    if (alpha < 0) alpha = 0; 
    line(start.x, start.y, end.x, end.y);
  }
  
  float getStartX() {
    return start.x;
  }
  
  float getStartY() {
    return start.y;
  }
}
