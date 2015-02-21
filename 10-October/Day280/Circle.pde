class Circle {
  float radius, theta;
  PVector loc;

  Circle(float x, float y, float radius_, float theta_) {
    radius = radius_;
    theta=theta_;
    loc = new PVector(x,y);
  }

  void display() {
    pushMatrix();
    rotate(theta);
    fill(radius%255);
    ellipse(loc.x, loc.y, radius/2, radius/2);
    if (radius%2 == 0) {
      theta += radians(theta/25);
    } else { 
      theta -= radians(theta/25);
    }
    popMatrix();
  }
}

