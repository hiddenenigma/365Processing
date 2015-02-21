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
    for (int i = 0; i < 360*2; i += 3) {
      float theta = radians(i);
      Vec2D polar = new Vec2D(100, theta);
      float len = noise(polar.y * radius) * (radius);
      Vec2D circ = polar.copy().toCartesian();
      if (i%2 == 0) {
        strokeWeight(1);
        stroke(0,75);
        theta += 0.01;
      } else {
        stroke(255,75);
        theta -= 0.01;
      }    
      line(circ.x+len, circ.y+len, len, len);
    }
    radius+=0.01;
  }
}

