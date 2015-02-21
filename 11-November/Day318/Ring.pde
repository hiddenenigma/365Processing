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
    for (int i = 0; i < 360*2; i += 5) {
      float theta = radians(i);
      Vec2D polar = new Vec2D(radius, theta);
      float len = noise(polar.y * radius*1.2) * (radius);
      Vec2D circ = polar.copy().toCartesian();
      if (i%2 == 0) {
        strokeWeight(1);
        stroke(0,50);
        theta += 0.001;
      } else {
        stroke(255,50);
        theta -= 0.001;
      }    
      line(circ.x-len, circ.y+len, len/2, len/2);
    }
    radius+=0.001;
  }
}

