float a = 1.8;
float b=1.6;
float c=1;
float d=1.7;

float xn;
float yn;
float zn;

float rotate_x;
float rotate_y;

int count = 1000;
float x, y, z;

float [][] points=new float[3][count];

void setup(){
  size(750,400,P3D);
  
  //xn+1= sin(a*yn)-c*cos(a*xn)
  //yn+1= sin(b*xn)-d*cos(d*yn)
  //zn+1= sin(xn)
  
  for(int i=0;i<count;i++){
    xn= sin(a*y)-c*cos(a*x);
    yn= sin(b*x)-d*cos(d*y);
    zn= sin(x);
    
    x=xn;
    y=yn;
    z=zn;
    
    points[0][i]=x*100;
    points[1][i]=y*50;
    points[2][i]=z*100;
  }
}

void draw(){
  background(#000000);
  fill(#FFFFFF);
  translate(width/2,height/2);
  
  rotateX(rotate_x);
  rotateY(rotate_y);
  
  for(int i=0;i<count;i++){
    pushMatrix();
  
    beginShape(POINTS);
    vertex(points[0][i],points[1][i],points[2][i]);
    endShape();
  
    stroke(#FFFFFF);
    popMatrix();
  }
  
  rotate_x+=0.03;
  rotate_y+=0.03;
}