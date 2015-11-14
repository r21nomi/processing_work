class Ball {
  int _radius;
  PVector _position;
  PVector _speed;
  int threshold = 80;
  
  Ball(int radius, PVector position, PVector speed) {
    _position = position;
    _radius = radius;
    _speed = speed;
  }

  void update() {
    if (mousePressed) {
      PVector dir = PVector.sub(_position, new PVector(mouseX, mouseY));
      dir.normalize();
      dir.mult(20);
      PVector tempSpeed = _speed.copy();
      tempSpeed.add(dir);
      _position.add(tempSpeed);
    } else {
      _position.add(_speed);
    }
    
    if(width < _position.x || 0 > _position.x)  {
      _speed.x *= -1;
      
      if (0 > _position.x) {
        _position.x = 0; 
      } else {
        _position.x = width;
      }
    }
    if(height < _position.y ||0 > _position.y)  {
      _speed.y *= -1;
      
      if (0 > _position.y) {
        _position.y = 0; 
      } else {
        _position.y = height;
      }
    }
    
    if (_position.x > mouseX - threshold
     && _position.x < mouseX + threshold
     && _position.y > mouseY - threshold
     && _position.y < mouseY + threshold) {
     //x[i] += (speedX[i] * (x[i] - mouseX) * 0.1);
     //y[i] += (speedY[i] * (y[i] - mouseY) * 0.1); 
     _position.x +=  (_speed.x * 8);
     _position.y +=  (_speed.y * 8);
    }
  }
  
  void draw() {
    fill(0);
    ellipse(_position.x, _position.y, _radius, _radius);
  }
  
  PVector getPosition() {
    return _position;
  }
}