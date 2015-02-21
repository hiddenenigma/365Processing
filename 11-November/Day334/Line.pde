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
    r+= 0.001;    
    theta += 0.01;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    rotate(theta);
    for (int i = 0; i < 360; i += 3) {
      float theta = radians(i);
      Vec2D polar = new Vec2D(radius, theta);
      float len = noise(polar.y * r) * (100);
      Vec2D circ = polar.copy().toCartesian();
      
      if (i%2 == 0) {
        stroke(255);
      } else {
        stroke(0);
      }
      
      line(circ.x, circ.y, len, circ.x, 0, len);
    }
    popMatrix();
  }
}

