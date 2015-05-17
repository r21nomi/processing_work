void setup(){
  size (600,800);
  background (255);
  frameRate(2);
  rectMode(CENTER);
}
 
void draw(){
  strokeWeight(5);    
  for(int y=25; y<height; y=y+50){
    float s = random(25);
    
    for (int x=25; x<width; x=x+50){
      float r = random(40);
      float t = random(30);
                 
      fill(random(255),0,255);
      stroke(255);
      rect(x,y,50,50);
      stroke(0);
      fill(255,230);
      ellipse(x,y,r,r);
      ellipse(x,y,s,s);
      stroke(255,0,255);
      ellipse(x,y,t,t);
    }
  }
}