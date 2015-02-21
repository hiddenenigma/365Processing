class Square {

  float radius;
  PVector loc;
  float angle;

  Square(float radius_) {
    radius = radius_;
    loc = new PVector();
  }

  void display() {
    pushMatrix();
    scale(0.5);
    rotate(angle);
    rect(loc.x, loc.y, radius, radius);
    if (radius%2 == 0) {
      angle-= 0.01;
      strokeWeight(5);
      stroke(radius%255);
    } else {
      angle+= 0.01;
      strokeWeight(5);
      stroke(radius%255);
    }
    radius-=2;
    popMatrix();
  }
}

