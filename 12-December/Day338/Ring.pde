class Particle {

  float radius;
  float r = 0;
  float theta;
  float x, y;

  Particle(float radius_, float theta_, float x_, float y_) {
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
    r+= 0.002;    
    radius+=0.01;
    theta += 0.001;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    rotate(theta);
    for (int i = 0; i < 360*2; i += 1) {
      float theta = radians(i);
      Vec2D polar = new Vec2D(radius, theta);
      float len = noise(polar.y * r) * radius;
      Vec2D circ = polar.copy().toCartesian();
      if (i%2 == 0) {
        stroke(0);
      } else {
        stroke(255);
      }
      strokeWeight(radius/100);
      point(circ.x, len, circ.y);
    }
    popMatrix();
  }
}

