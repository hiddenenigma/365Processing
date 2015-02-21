class Circle {
  float numPoints;
  float radius, theta;

  Circle(float radius_, float numPoints_) {
    numPoints = numPoints_;
    radius = radius_;
  }

  void display() {
    pushMatrix();
    rotate(theta);
    for (int i = 0; i < numPoints; i++) {
      float angle = TWO_PI/numPoints * i;
      float x = cos(angle) * radius;
      float y = sin(angle) * radius;
      line(x, y, 0, 0);
    }
    if (radius%2 == 0) {
      stroke(255);
      theta += 0.0003;
    } else { 
      stroke(0);
      theta -= 0.0003;
    }
    popMatrix();
  }
}

