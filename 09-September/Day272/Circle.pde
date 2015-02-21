class Circle {
  int numPoints;
  float radius, theta;
  float grow;

  Circle(float radius_, int numPoints_) {
    numPoints = numPoints_;
    radius = radius_;
    grow = 0;
  }

  void display() {
    pushMatrix();
    rotate(theta);
    for (int i = 0; i < numPoints; i++) {
      float angle = TWO_PI/numPoints * i;
      float x = cos(angle) * radius;
      float y = sin(angle) * radius;
      rect(x, y, radius, radius);
    }
    if (radius%2 == 0) {
      fill(255);
      theta += 0.008;
    } else { 
      fill(0);
      theta -= 0.008;
    }
    popMatrix();
  }
}

