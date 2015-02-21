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
    for (int i = 0; i < 360*3; i += 5) {
      float theta = radians(i);
      Vec2D polar = new Vec2D(200, theta);
      float len = noise(polar.y * radius) * (radius);
      Vec2D circ = polar.copy().toCartesian();
      if (i%2 == 0) {
        strokeWeight(5);
        stroke(0);
        theta += 0.001;
      } else {
        stroke(255);
        theta -= 0.001;
      }    
      line(circ.x/len, circ.y/len, len, len);
    }
    radius+=0.001;
  }
}

