class Ring {

  float radius;
  float r = 0;
  float theta;
  float x, y;

  Ring(float radius_, float theta_, float x_, float y_) {
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
     r+= 0.01;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    rotate(theta);
    for (int i = 0; i < 360*2; i += 1) {
      float theta = radians(i);
      Vec2D polar = new Vec2D(i, theta);
      float len = noise(polar.y * r) * (radius);
      Vec2D circ = polar.copy().toCartesian();
      
      if (i%2 == 0) {
        fill(0);
      } else {
        fill(255);
      }
      
      circ.x ++;
      ellipse(circ.x+circ.y, circ.y+circ.x, len/5, len/5);
    }
    popMatrix();
    theta += 0.01;
    r+= 0.01;
    radius+=5;
  }
}

