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
    for (int i = 0; i < 360*2; i += 1) {
      float theta = radians(i);
      Vec2D polar = new Vec2D(radius, theta);
      float len = noise(polar.y * radius) * 15;
      Vec2D circ = polar.copy().toCartesian();
      strokeWeight(1);
      ellipse(circ.x, circ.y, len, len);
    }
    if (r%2 == 0) {
      stroke(0,60);
      theta += 0.0001;
    } else {
      theta -= 0.0001;
    }
  }
}

