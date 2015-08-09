import java.util.*;

class DelaunayTriangles {
  
  public HashSet<Triangle> mTriangleSet;
  public ArrayList<Point> mPointList;
  Triangle mHugeTriangle;  // 全体を覆う巨大三角形
  
  DelaunayTriangles(ArrayList<Point> pointList) {
    mTriangleSet = new HashSet();
    mPointList = pointList;
    
    update();
  }
  
  public void addPoint(Point point) {
    mPointList.add(point);
  }
  
  public void update() {
    // 全体を覆う巨大三角形を取得
    mHugeTriangle = getHugeTriangle();
    mTriangleSet.clear();
    mTriangleSet.add(mHugeTriangle);
    
    try{
      for (Point point : mPointList) {
        
        HashMap<Triangle, Boolean> tempTriangleSet = new HashMap();
        
        // 既存の三角形をチェック
        // HashMapからアイテムの削除が発生するのでiteratorを用いる
        for(Iterator tIter = mTriangleSet.iterator(); tIter.hasNext();) {
          Triangle t = (Triangle)tIter.next();
          
          // 三角形の外接円を取得
          Circle circle = getCircumscribedCirclesOfTriangle(t);
          
          // 外接円の内部に対象の点が存在する三角形があれば新たに分割し直し、その三角形をリストから削除
          if (Point.dist(circle.getCenter(), point) <= circle.getRadius()) {
            // 新たな三角形を一時ハッシュに追加
            addElementToRedundanciesMap(tempTriangleSet, new Triangle(point, t.p1, t.p2));
            addElementToRedundanciesMap(tempTriangleSet, new Triangle(point, t.p2, t.p3));
            addElementToRedundanciesMap(tempTriangleSet, new Triangle(point, t.p3, t.p1));
            tIter.remove();
          }
        }
        
        // 一時的に三角形が格納されたハッシュをチェック
        for (Map.Entry entry : tempTriangleSet.entrySet()) {
          Triangle triangle = (Triangle)entry.getKey();
          boolean isUnique = (Boolean)entry.getValue();
          
          // 一時ハッシュ内に重複する三角形がなければリストに追加
          if (isUnique) {
            mTriangleSet.add(triangle);
          }
        }
      }
        
      for (Iterator tIter = mTriangleSet.iterator(); tIter.hasNext();) {
        Triangle triangle = (Triangle)tIter.next();
        
        if(mHugeTriangle.hasCommonPoints(triangle)) {
          tIter.remove(); 
        }
      }
    } catch(Exception e) {
      return;
    }
  }
  
  public void draw() {
    for (Iterator tIter = mTriangleSet.iterator(); tIter.hasNext();) {
      Triangle t = (Triangle)tIter.next();
      t.draw();
    }
  }
  
  private Triangle getHugeTriangle() {
    return getHugeTriangle(new PVector(0, 0), new PVector(width, height));
  }
  
  private Triangle getHugeTriangle(PVector start, PVector end) {
    if (end.x < start.x) {
      float tmp = start.x;  
      start.x = end.x;  
      end.x = tmp;  
    }
    if (end.y < start.y) {
      float tmp = start.y;
      start.y = end.y;
      end.y = tmp;
    }
    
    PVector center = new PVector((end.x - start.x) / 2, (end.y - start.y) / 2);
    float radius = center.dist(start) + 1;
    
    float x1 = center.x - sqrt(3) * radius;  
    float y1 = center.y - radius;  
    Point p1 = new Point(x1, y1);  
      
    float x2 = center.x + sqrt(3) * radius;  
    float y2 = center.y - radius;  
    Point p2 = new Point(x2, y2);  
      
    float x3 = center.x;  
    float y3 = center.y + 2 * radius;  
    Point p3 = new Point(x3, y3);  
  
    return new Triangle(p1, p2, p3);  
  }
  
  private void addElementToRedundanciesMap(HashMap hashMap, Triangle triangle) {
    if (hashMap.containsKey(triangle)) {
      hashMap.put(triangle, new Boolean(false));
    } else {
      hashMap.put(triangle, new Boolean(true));
    }
  }
  
  /**
   * @Param t Triangle
   * Return circumscribed circle of given triangle
   * 
   */
  private Circle getCircumscribedCirclesOfTriangle(Triangle t) {
    float x1 = t.p1.x;
    float y1 = t.p1.y;
    float x2 = t.p2.x;
    float y2 = t.p2.y;
    float x3 = t.p3.x;
    float y3 = t.p3.y;
    float c = 2 * (((x2 - x1) * (y3 - y1)) - (y2 - y1) * (x3 - x1));
    float x = ((y3 - y1) * ((x2 * x2) - (x1 * x1) + (y2 * y2) - (y1 * y1)) + (y1 - y2) * ((x3 * x3) - (x1 * x1) + (y3 * y3) - (y1 * y1))) / c;
    float y = ((x1 - x3) * ((x2 * x2) - (x1 * x1) + (y2 * y2) - (y1 * y1)) + (x2 - x1) * ((x3 * x3) - (x1 * x1) + (y3 * y3) - (y1 * y1))) / c;
    Point center = new Point(x, y);
    float radius = Point.dist(center, t.p1);
    
    return new Circle(center, radius);
  }
}
