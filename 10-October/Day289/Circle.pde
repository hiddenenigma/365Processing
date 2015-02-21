class Circle {
  float radius, theta;
  PVector loc;

  Circle(float x, float y, float radius_, float theta_) {
    radius = radius_;
    theta = theta_;
    loc = new PVector(x, y);
  }

  void display() {
    pushMatrix();
    rotate(theta);
    ellipse(loc.x, loc.y, radius, radius);
    if (radius%2 == 0) {
      fill(0);
      theta -= 0.005;
    } else { 
      fill(255);
      theta += 0.005;
    }
    radius-= 2;
    popMatrix();
  }
}

