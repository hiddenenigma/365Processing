class Circle {
  int numPoints;
  float radius, theta;

  Circle(float radius_) {
    numPoints = 8;
    radius = radius_;
  }

  void display() {
    pushMatrix();
    rotate(theta);
    beginShape();
    for (int i = 0; i < numPoints; i++) {
      float angle = TWO_PI/numPoints * i;
      float x = cos(angle) * radius;
      float y = sin(angle) * radius;
      rect(x, y, radius, radius);
    }
    endShape();
    if (radius%2 == 0) {

      fill(255);
      theta -= 0.01;
    } else { 
      fill(0);
      theta += 0.01;
    }
    popMatrix();
  }
}

