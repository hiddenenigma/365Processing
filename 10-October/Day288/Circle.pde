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
    strokeWeight(2);
    ellipse(loc.x, loc.y, radius, radius);
    stroke(255, 80);
    theta -= 0.005;
    radius+= 1;
    popMatrix();
  }
}

