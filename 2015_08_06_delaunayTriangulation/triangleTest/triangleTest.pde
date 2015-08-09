void setup() {
  size(displayWidth, displayHeight);
}

void draw() {
  background(255);
  
  ArrayList<PVector> list = getHugeTriangle(new PVector(0, 0), new PVector(900, 500));
  
  stroke(255, 0, 0);
  noFill();
  triangle(list.get(0).x, list.get(0).y, list.get(1).x, list.get(1).y, list.get(2).x, list.get(2).y);
}

ArrayList<PVector> getHugeTriangle(PVector start, PVector end) {  
    // start: 矩形の左上座標、  
    // end  : 矩形の右下座標…になるように  
    if(end.x < start.x) {  
      float tmp = start.x;  
      start.x = end.x;  
      end.x = tmp;  
    }  
    if(end.y < start.y) {  
      float tmp = start.y;  
      start.y = end.y;  
      end.y = tmp;  
    }  
      
    // 1) 与えられた矩形を包含する円を求める  
    //      円の中心 c = 矩形の中心  
    //      円の半径 r = |p - c| + ρ  
    //    ただし、pは与えられた矩形の任意の頂点  
    //    ρは任意の正数  
    PVector center = new PVector( (end.x - start.x) / 2.0, (end.y - start.y) / 2.0 );  
    float radius = dist(center.x, center.y, start.x, start.y) + 1.0;
  
//    stroke(0, 0, 0);
//    noFill();
//    rect(start.x, start.y, end.x, end.y);
      
    // 2) その円に外接する正三角形を求める  
    //    重心は、円の中心に等しい  
    //    一辺の長さは 2√3･r  
    float x1 = center.x - sqrt(3) * radius;  
    float y1 = center.y - radius;  
    PVector p1 = new PVector(x1, y1);  
      
    float x2 = center.x + sqrt(3) * radius;  
    float y2 = center.y - radius;  
    PVector p2 = new PVector(x2, y2);  
      
    float x3 = center.x;  
    float y3 = center.y + 2 * radius;  
    PVector p3 = new PVector(x3, y3);
    
    ArrayList<PVector> list = new ArrayList();
    list.add(p1);
    list.add(p2);
    list.add(p3);
  
    return list;      
  }  
