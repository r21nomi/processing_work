class Blob implements Cell {

  ArrayList<Anchor> anchors = new ArrayList();
  float originalRadius;
  float minRadius;
  float radius_x;
  float radius_y;
  int vertexCount;
  color col;
  float originX;
  float originY;
  PVector direction;

  Blob(int vertexCount,
       float radius,
       color col,
       float offset,
       float theta,
       float originX,
       float originY) {
    this.vertexCount = vertexCount;
    this.originalRadius = this.radius_x = this.radius_y = radius;
    this.minRadius = originalRadius / 1.5;
    this.col = col;
    this.originX = originX;
    this.originY = originY;
    this.direction = new PVector(random(-2, 2), random(-2, 2));

    // Layout vertex in a circular pattern.
    float step = 360 / vertexCount;
    for (int i = 0, len = 360 + (int)(step * 3); i < len; i += step) {
      boolean isHandlePoint = (i == 0 || i == len - step);

      anchors.add(new Anchor(radius_x * cos(radians(i)), radius_y * sin(radians(i)), 10, offset, theta, isHandlePoint));
    }
  }

  /**
   * Reduce the anchor's radius if the anchor is exceeded the boundary.
   */
  void reduceAnchorsRadius() {
    for (int i = 0, len = anchors.size(); i < len; i++) {
      Anchor anchor = anchors.get(i);
      PVector location = anchor.getLocation();

      // For x
      if (originX + location.x > originX + radius_x) {
        anchor.addLocation(new PVector(-1, 0));
      } else if (originX + location.x < originX - radius_x) {
        anchor.addLocation(new PVector(1, 0));
      }
      // For y
      if (originY + location.y > originY + radius_y) {
        anchor.addLocation(new PVector(0, -1));
      } else if (originY + location.y < originY - radius_y) {
        anchor.addLocation(new PVector(0, 1));
      }
    }
  }

  /**
   * Revert the anchor's radius if the value is changed from original one.
   */
  void revetAnchorsRadius() {
    for (Anchor anchor : anchors) {
      PVector location = anchor.getLocation();
      PVector originalLocation = anchor.getOriginalLocation();

      // For x
      if (location.x > originalLocation.x) {
        anchor.addLocation(new PVector(-1, 0));
      } else if (location.x < originalLocation.x) {
        anchor.addLocation(new PVector(1, 0));
      }
      // For y
      if (location.y > originalLocation.y) {
        anchor.addLocation(new PVector(0, -1));
      } else if (location.y < originalLocation.y) {
        anchor.addLocation(new PVector(0, 1));
      }
    }
  }

  void checkIfAnchorExceedBoundary() {
    // For x direction.
    if (originX + radius_x > displayWidth || originX - radius_x < 0) {
     radius_x -= 1;
     reduceAnchorsRadius();

     if (radius_x < minRadius) {
       direction.x *= -1;
       originX += direction.x;
     }
    } else {
     if (radius_x < originalRadius) {
       radius_x += 1;
       revetAnchorsRadius();
     }
     originX += direction.x;
    }

    // For y direction.
    if (originY + radius_y > displayHeight || originY - radius_y < 0) {
     radius_y -= 1;
     reduceAnchorsRadius();

     if (radius_y < minRadius) {
       direction.y *= -1;
       originY += direction.y;
     }
    } else {
     if (radius_y < originalRadius) {
       radius_y += 1;
       revetAnchorsRadius();
     }
     originY += direction.y;
    }
  }

  @Override
  public void update() {
    checkIfAnchorExceedBoundary();

    for (int i = 0, len = anchors.size(); i < len; i++) {
      Anchor anchor = anchors.get(i);
      if (i == len - 2) {
        // Connect last point to first point.
        anchor.setLocation(anchors.get(1).getLocation());
      } else {
        anchor.update();
      }
    }
  }

  @Override
  public void draw(PGraphics pg) {
    pg.fill(col);
    pg.noStroke();
    pg.pushMatrix();

    pg.translate(originX, originY);
    
    // Shape
    pg.beginShape();
    for (Anchor anchor : anchors) {
      anchor.drawVertex(pg);
    }
    pg.endShape();

    pg.popMatrix();
  }
}
