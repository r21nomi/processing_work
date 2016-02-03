class Agent{
  PVector pos, vel, followSum, escapeSum;
  color c;
 
  Agent(int _x, int _y){
    pos = new PVector(_x,_y); 
    vel = new PVector(0,0);
    followSum = new PVector(0,0);
    escapeSum = new PVector(0,0);
    //c = color(random(255),random(255),random(255));
  }
 
  void move(){
    vel.add(follow());
    vel.add(escape());
    vel.limit(1);
    pos.add(vel); 
  }
 
  void display(){
    //set((int)pos.x,(int)pos.y,c);
    fill(#0000ff);
    ellipse(pos.x, pos.y, 1, 1);
  }
 
  PVector follow(){
    followSum.mult(0);
    int count = 0;
    for(int i = 0; i < attrPoints.size(); i++){
      PVector aPt = attrPoints.get(i);
      float d = pos.dist(aPt);
      if (d < 450){
        PVector dir = PVector.sub(aPt, pos);
        dir.normalize();
        dir.div(d);
        followSum.add(dir);
        count++; 
      }
    } 
    if (count > 0) {
      followSum.div(count);
    }
    return followSum;
  }
 
  PVector escape(){
    escapeSum.mult(0);
    int count = 0;
    for(int i = 0; i<repPoints.size(); i++){
      PVector rPt = repPoints.get(i);
      float d = pos.dist(rPt);
      if (d < 450){
        PVector dir = PVector.sub(rPt,pos);
        dir.normalize();
        dir.div(d);
        escapeSum.sub(dir);
        count++; 
      }
    } 
    if (count > 0) {
      escapeSum.div(count);
    }
    return escapeSum;
  }
}