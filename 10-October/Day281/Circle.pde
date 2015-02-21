class Circle {
  float radius, theta;
  PVector loc;

  Circle(float x, float y, float radius_, float theta_) {
    loc = new PVector(x, y);
    radius = radius_;
    theta = theta_;
  }

  void display() {
    pushMatrix();
    rotate(theta);
    ellipse(loc.x, loc.y, radius, radius);
    if (radius%3 == 0) {
      fill(radius%255);
      theta += 0.01;
    } else { 
      fill(radius%255);
      theta -= 0.01;
    }
    popMatrix();
  }
}

