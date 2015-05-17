float _lineRate = 0.07;
float _flgNum = 0;

void setup() {
  size(displayWidth, displayHeight);
  stroke(0);
  fill(255);

  ArrayList<Point> points = makeDots();
  float maxLevel = 10;
  float currentLevel = 0;
  Branch branch = new Branch(points, maxLevel, currentLevel);
}

void draw() {
  background(255);
  ArrayList<Point> points = makeDots();
  float maxLevel = 10;
  float currentLevel = 0;

  _flgNum += 0.1;
  float band = sin(_flgNum) / 50;
  _lineRate += band;

  Branch branch = new Branch(points, maxLevel, currentLevel);
}

ArrayList<Point> makeDots() {
  ArrayList<Point> points = new ArrayList();

  for (int i = 0; i < 360; i+=45) {
    float radius = 250;
    float centerX = displayWidth/2;
    float centerY = displayHeight/2;
    float x = (float)(centerX + radius * Math.cos(i * Math.PI / 180));
    float y = (float)(centerY + radius * Math.sin(i * Math.PI / 180));
    points.add(new Point(x, y));
  } //<>//
  return points;
}

class Branch {
  public Branch(ArrayList<Point> points, float ml, float cl) {

    connectDots(points);

    if (cl < ml) {
      cl ++;
      ArrayList<Point> midPoints = drawMidPoints(points);
      ArrayList<Point> prjPoints = drawPrjLines(points, midPoints);
      Branch branch = new Branch(prjPoints, ml, cl);
    }
  }

  void connectDots(ArrayList<Point> dots) {
    for (int i = 0; i < dots.size (); i++) {
      if (i == dots.size()-1) {
        line(dots.get(i).x, dots.get(i).y, dots.get(0).x, dots.get(0).y);
      } else {
        line(dots.get(i).x, dots.get(i).y, dots.get(i+1).x, dots.get(i+1).y);
      }
    }
  }

  ArrayList<Point> drawMidPoints(ArrayList<Point> points) {
    ArrayList<Point> midPoints = new ArrayList();

    for (int i = 0; i<points.size (); i++) {
      if (i == points.size()-1) {
        Point midPoint = checkMidPoints(points.get(i), points.get(0));
        //ellipse(midPoint.x,midPoint.y,10,10);
        midPoints.add(midPoint);
      } else {
        Point midPoint = checkMidPoints(points.get(i), points.get(i+1));
        //ellipse(midPoint.x,midPoint.y,10,10);
        midPoints.add(midPoint);
      }
    }
    return midPoints;
  }

  ArrayList<Point> drawPrjLines(ArrayList<Point> points, ArrayList<Point> midPoints) {
    ArrayList<Point> prjPoints = new ArrayList();

    for (int i = 0; i<points.size (); i++) {

      int nextIndex = i+3;
      if (nextIndex >= points.size())nextIndex -= points.size();

      Point prjPoint = checkPrjPoint(midPoints.get(i), points.get(nextIndex));
      line(prjPoint.x, prjPoint.y, midPoints.get(i).x, midPoints.get(i).y);
      //ellipse(prjPoint.x,prjPoint.y,10,10);
      //console.log(i,nextIndex);
      prjPoints.add(prjPoint);
    }
    return prjPoints;
  }

  Point checkMidPoints(Point me, Point target) {
    Point midPoint = new Point(30, 30);

    if (me.x > target.x) {
      midPoint.x = target.x + (me.x - target.x)/2;
    } else {
      midPoint.x = me.x + (target.x - me.x)/2;
    }

    if (me.y > target.y) {
      midPoint.y = target.y + (me.y - target.y)/2;
    } else {
      midPoint.y = me.y + (target.y - me.y)/2;
    }
    return midPoint;
  }

  Point checkPrjPoint(Point mp, Point op) {
    float px = 0;
    float py = 0;
    float adj = 0;
    float opp = 0;

    if (op.x > mp.x) {
      opp = op.x - mp.x;
    } else {
      opp = mp.x - op.x;
    }

    if (op.y > mp.y) {
      adj = op.y - mp.y;
    } else {
      adj = mp.y - op.y;
    }

    if (op.x > mp.x) {
      px = mp.x + (opp * _lineRate);
    } else {
      px = mp.x - (opp * _lineRate);
    }

    if (op.y > mp.y) {
      py = mp.y + (adj * _lineRate);
    } else {
      py = mp.y - (adj * _lineRate);
    }

    Point prjPoint = new Point(px, py);
    return prjPoint;
  }
}

class Point {
  float x;
  float y;
  public Point(float x, float y) {
    this.x = x;
    this.y = y;
  }
}