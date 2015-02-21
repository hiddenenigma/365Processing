class Ring {

  float radius;
  float r = 0;
  float theta;

  Ring(float radius_, float theta_) {
    radius = radius_;
    theta = theta_;
  }

  void display() {
    rotate(theta);
    for (int i = 0; i < 360*2; i += 5) {
      float theta = radians(i);
      Vec2D polar = new Vec2D(radius, theta);
      float len = noise(polar.y * radius) * (radius);
      Vec2D circ = polar.copy().toCartesian();
      strokeWeight(len);
      ellipse(circ.x,  circ.y, len, len);
    }
    if (radius%2 == 0) {
      stroke(0, 15);
      theta += 0.0000001;
    } else {
      stroke(255,5);
    }
  }
}

