class Circle {

  float radius;
  PVector loc;
  float angle;

  Circle(float radius_) {
    radius = radius_;
    loc = new PVector();
  }

  void display() {
    rotate(angle);
    ellipse(loc.x, loc.y, radius, radius);
    if (radius%2 == 0) {
      stroke(255);
      angle-= 0.01;
    } else {
      angle+= 0.01;
      stroke(0);
    }
  }
}

