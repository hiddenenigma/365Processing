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
    for (int i = 0; i < 360*3; i += 5) {
      float theta = radians(i);
      Vec2D polar = new Vec2D(radius, theta);
      float len = noise(polar.y * radius) * (radius);
      Vec2D circ = polar.copy().toCartesian();
      strokeWeight(len);
      point(circ.x,  circ.y);
    }
    if (radius%2 == 0) {
      stroke(0, 18);
      theta += 0.01;
    } else {
      stroke(255,5);
      theta -= 0.01;
    }
  }
}

