class Circle {
  int numPoints;
  float radius, theta;
  float grow;

  Circle(float radius_) {
    numPoints = 120;
    radius = radius_;
    grow = 0;
  }

  void display() {
    pushMatrix();
    translate(width/2, height/2);
    rotate(theta);
    for (int i = 0; i < numPoints; i+=10) {
      float angle = TWO_PI/numPoints * i;
      float x = cos(angle) * radius;
      float y = sin(angle) * radius;
      ellipse(x, y, radius, radius);
    }
    if (radius%2 == 0) {
      fill(0);
      theta += 0.01;
    } else { 
      fill(255);
      theta -= 0.01;
    }
    popMatrix();
  }
}

