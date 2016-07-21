ArrayList<Ball> balls = new ArrayList();

void setup() {
    size(600, 600);

    for (int i = 0, len = 10; i < len; i++) {
        balls.add(new Ball(random(width), random(height)));
    }
}

void draw() {
    background(255);

    loadPixels();

    for (int x = 0, len = width; x < len; x++) {
        for (int y = 0, len2 = height; y < len2; y++) {
            int index = x + y * width;
            int sum = 0;
            for (Ball ball : balls) {
                float d = dist(x, y, ball.location.x, ball.location.y);
                sum += 120 * ball.radius / d;
            }
            pixels[index] = color(sum);
        }
    }

    updatePixels();

    for (Ball ball : balls) {
        ball.update();
        // ball.draw();
    }
}
