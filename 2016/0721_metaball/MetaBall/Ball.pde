class Ball {
    PVector location;
    PVector velocity;
    float radius;

    Ball(float x, float y) {
        location = new PVector(x, y);
        velocity = PVector.random2D();
        velocity.mult(random(2, 5));
        radius = random(20, 50);
    }

    void update() {
        location.add(velocity);

        if (location.x < 0 || location.x > width) {
            velocity.x *= -1;
        }
        if (location.y < 0 || location.y > height) {
            velocity.y *= -1;
        }
    }

    void draw() {
        noFill();
        stroke(0);
        strokeWeight(4);
        ellipse(location.x, location.y, radius * 2, radius * 2);
    }
}
