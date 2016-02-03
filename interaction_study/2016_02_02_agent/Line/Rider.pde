class Rider {
  static final int MAX_STEP = 5;
  static final color BLACK = -16777216;
  float SPEED; 
  float x, y;
  float pastX, pastY;
  float speedX, speedY;
  float radius;
  int step = 0;
  color currentColor;
  float acceleration = 0.1;
  float dirX, dirY;
  
  Rider(float x, float y, float speed) {
    this.x = pastX = x;
    this.y = pastY= y;
    SPEED = speed;
    speedX = SPEED;
    speedY = SPEED;
    radius = 4;
    currentColor = -1;
    dirX = random(-1, 1);
    dirY = random(-1, 1);
  }
  
  void update() {
    speedX += acceleration;
    speedY += acceleration; //<>//
    x += speedX * dirX;
    y += speedY * dirY;
  }
  
  void check() {
    if (step > MAX_STEP) {
      //updateDir();
      step = 0;
      
    } else {
      color col = get((int)(x + speedX * dirX), (int)(y + speedY * dirY));
      //color col = get((int)x, (int)y);
      if (col != BLACK&& col != currentColor) {
        currentColor = color(random(255),random(255),random(255));
        updateDir();
        speedX = SPEED;
        speedY = SPEED;
        alpha = 255;
      } else {
        alpha = 10;
      }
    }
    if (x < radius) {
      dirX *= -1;
      x = radius;
      
    } else if (x > width - radius) {
      dirX *= -1;
      x = width - radius;
    }
    if (y < radius) {
      dirY *= -1;
      y = radius;
        
    } else if(y > height - radius) {
      dirY *= -1;
      y = height - radius;
    }
    if (random(100) < 10) {
      step++;
    }
  }
  
  void display() {
    fill(currentColor, 200);
    stroke(currentColor);
    strokeWeight(2);
    line(x, y, pastX, pastY);
    
    pastX = x;
    pastY = y;
  }
  
  void updateDir() {
    int rand = round(random(7));
    
    switch (rand) {
      case 0:
        dirX = 0;
        dirY = -1;
        break;
        
      case 1:
        dirX = 1;
        dirY = -1;
        break;
        
      case 2:
        dirX = 1;
        dirY = 0;
        break;
        
      case 3:
        dirX = 1;
        dirY = 1;
        break;
        
      case 4:
        dirX = 0;
        dirY = 1;
        break;
        
      case 5:
        dirX = -1;
        dirY = 1;
        break;
        
      case 6:
        dirX = -1;
        dirY = 0;
        break;
        
      case 7:
        dirX = -1;
        dirY = -1;
        break;
    }
  }
}