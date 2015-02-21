class Circle {
  int numPoints;
  float radius, theta;

  Circle(float radius_) {
    numPoints = 90;
    radius = radius_;
  }

  void display() {
    pushMatrix();
    translate(width/2, height/2);
    rotate(theta);
    for (int i = 0; i < numPoints; i++) {
      float angle = TWO_PI/numPoints * i;
      float x = cos(angle) * radius;
      float y = sin(angle) * radius;
      ellipse(x, y, 8, 8);
    }
    if (radius%2 == 0) {
      theta += 0.0005;
    } else { 
      theta -= 0.0005;
    }
    popMatrix();
  }
}

