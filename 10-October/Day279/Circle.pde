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
      ellipse(x, y, 10, 10);
    }
    if (radius%2 == 0) {
      fill(radius%255);
      strokeWeight(1);
      theta -= 0.001;
    } else { 
      fill(radius%255);
      theta += 0.001;
    }
    popMatrix();
    radius+=2;
    
  }
}

