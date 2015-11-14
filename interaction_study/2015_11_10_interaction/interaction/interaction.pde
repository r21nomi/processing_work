int numObj = 400;
int speedThreshold = 5;
 
float[] x = new float[numObj];
float[] y = new float[numObj];
float[] speedX = new float[numObj];
float[] speedY = new float[numObj];

ArrayList<Ball> balls = new ArrayList();
 
void setup(){
  size(600, 600);
  background(0);
  smooth();
   
  for (int i=0; i<numObj; i++) {
    PVector position = new PVector(random(width), random(height));
    PVector speed = new PVector(random(-speedThreshold, speedThreshold), random(-speedThreshold, speedThreshold));
    Ball ball = new Ball(10, position, speed);
    
    balls.add(ball);
  }  
}
 
void draw(){
  background(0);
 
  for (int i = 0; i < balls.size(); i++) {
    stroke(0);
    Ball ball1 = balls.get(i);
    ball1.update();
    
    int limit = 10;
    
    for(int j = 0; j < balls.size(); j++){
      Ball ball2 = balls.get(j);
      float dist = PVector.dist(ball1.getPosition(), ball2.getPosition());
       
      if (limit > 0 && dist < 50) {
       stroke(255,255,255,40);
       strokeWeight(1);
       line(ball1.getPosition().x,
            ball1.getPosition().y,
            ball2.getPosition().x,
            ball2.getPosition().y);
            
            limit--;
      }
    }
  }
}