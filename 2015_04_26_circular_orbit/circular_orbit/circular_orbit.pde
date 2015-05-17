
float x = 0,
y = 0,
centerX,
centerY,
radius = 100,
ellipseRadius = 30,
degree = 0,
rad = 0;

void setup() {
  size(displayWidth, displayHeight);
  stroke(255);
  fill(255);
  centerX = displayWidth / 2;
  centerY = displayHeight / 2;
}

void draw() {
  background(0);

  // Update degree
  degree += 10;

  // Convert degree into radian
  rad = degree * PI / 180;

  // Calculate x
  x = centerX + radius * cos(rad);

  // Calculate y
  y = centerY + radius * sin(rad);

  // Draw circle
  ellipse(x, y, ellipseRadius, ellipseRadius);
}
