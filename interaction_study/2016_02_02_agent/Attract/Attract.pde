ArrayList<Agent> agents;
ArrayList<PVector> attrPoints;
ArrayList<PVector> repPoints;
 
int agentsAmount = 17000;
int attrAmount = 2;
int repAmount = 2;
 
void setup(){
  size(900, 600, P2D);
  stroke(0);
  agents = new ArrayList();
  attrPoints = new ArrayList();
  repPoints = new ArrayList();
 
  for(int i = 0; i < attrAmount; i++){
    attrPoints.add(new PVector(round(random(10, width - 10)), round(random(10, height - 10))));  //create attraction points   
  }
  for(int i = 0; i < repAmount; i++){
    repPoints.add(new PVector(round(random(10, width - 10)), round(random(10, height - 10))));  //create repulsion points     
  }
 
  for(int i = 0; i < agentsAmount; i++){
    agents.add(new Agent(round(random(10, width - 10)), round(random(10, height - 10))));  //create agents
  }
}
 
void draw(){
  noStroke();
  background(0);
  
  for(int i = 0; i < agents.size(); i++){
    Agent a = agents.get(i);
    a.move();
    a.display();
  } 
 
  for(int i = 0; i < attrPoints.size(); i++){  //display attraction points
    PVector aPt = attrPoints.get(i);
    fill(#ff0000, 160);
    ellipse(aPt.x, aPt.y, 10, 10);
  }
 
  for(int i = 0; i < repPoints.size(); i++){  //display repulsion points
    PVector rPt = repPoints.get(i);
    fill(#00FF00, 160);
    ellipse(rPt.x, rPt.y, 10, 10);
  }  
}

void mouseReleased() {
  int rand = round(random(2));
  
  if (rand % 2 == 0) {
    attrPoints.add(new PVector(mouseX, mouseY));
    
  } else {
    repPoints.add(new PVector(mouseX, mouseY));
  }
}