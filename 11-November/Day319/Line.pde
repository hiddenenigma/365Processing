class Line {

  float radius;
  float r = 0;
  float theta;

  Line(float radius_, float theta_) {
    radius = radius_;
    theta = theta_;
  }

  void display() {
    rotate(theta);
    for (int i = 0; i < 600; i += 1) {
      float theta = radians(i);
      Vec2D polar = new Vec2D(theta/2, theta);
      float len = noise(polar.y * radius) * (135);
      Vec2D circ = polar.copy().toCartesian();
      if (i%2 == 0) {
        strokeWeight(1);
        stroke(0,50);
      } else {
        stroke(255,50);
      }    
      line(circ.x+len, circ.y+len, len, len);
    }
    radius+=0.0005;
  }
}

