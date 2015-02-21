class Line {
  int numPoints;
  float radius, theta;

  Line(float radius_) {
    numPoints = 500;
    radius = radius_;
  }

  void display() {
    pushMatrix();
    translate(width/2, height/2);
    rotate(theta);
    for (int i = 0; i < numPoints; i+=5) {
      float angle = TWO_PI/numPoints * i;
      float x = cos(angle) * radius;
      float y = sin(angle) * radius;
      line(x, y, radius, radius);
    }
    if (radius%2 == 0) {
      stroke(0);
      theta += 0.01;
    } else { 
      stroke(255);
      theta -= 0.01;
    }
    popMatrix();
  }
}

