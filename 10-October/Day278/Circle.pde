class Circle {
  float numPoints;
  float radius, theta;

  Circle(float radius_, float numPoints_) {
    numPoints = 1;
    radius = radius_;
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
      stroke(255);
      strokeWeight(8);
      theta -= 0.001;
    } else { 
      stroke(0);
      theta += 0.001;
    }
    popMatrix();
    numPoints+=0.07;
    radius+=2;
  }
}

