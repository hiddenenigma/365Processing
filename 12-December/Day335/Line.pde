class Line {

  float radius;
  float r = 0;
  float theta;
  float x, y;

  Line(float radius_, float theta_, float x_, float y_) {
    radius = radius_;
    theta = theta_;
    x = x_;
    y = y_;
  }

  void run() {
    update();
    display();
  }

  void update() {
    r+= 0.0001;    
    radius+=0.0001;
    theta += 0.01;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    rotate(theta);
    for (int i = 0; i < 360; i += 1) {
      float theta = radians(i);
      Vec2D polar = new Vec2D(radius, theta);
      float len = noise(polar.y * r) * radius;
      Vec2D circ = polar.copy().toCartesian();
      if (i%2 == 0) {
        stroke(255);
      } else {
        stroke(0);
      }
      line(circ.x, circ.y, 0, 0, circ.x+len, circ.y+len);
    }
    popMatrix();
  }
}

