class Particle {
  
  PVector mLocation;
  PVector mVelocity;
  float mRadius;
  float mAlpha;
  float mMoveSpeed;
  PImage mImg;

  Particle(PImage img, PVector location, PVector velocity) {
    mLocation = location.get();
    mVelocity = velocity.get();
    mRadius = random(160, 180);
    mMoveSpeed = random(3, 10);
    mAlpha = 200;
    mImg = img;
  }
  
  void update() {
    mLocation.add(mVelocity);
    mAlpha -= mMoveSpeed * 2;
    mRadius -= mMoveSpeed;
    if (mRadius < 0) mRadius = 0; 
  }
  
  void display() {
//    noStroke();
//    fill(color(100, 25, 25), mAlpha);
//    ellipse(mLocation.x ,mLocation.y ,mRadius, mRadius);
    imageMode(CENTER);
    tint(255, mAlpha);
    image(mImg, mLocation.x ,mLocation.y, mRadius, mRadius);
  }
  
  boolean isDead() {
    return mAlpha < 0;
  }
}
