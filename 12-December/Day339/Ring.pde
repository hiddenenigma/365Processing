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
    r+= 0.01;    
    radius+=0.01;
    theta += 0.001;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    rotate(theta);
    for (int i = 0; i < 255*5; i += 1) {
      float theta = radians(i);
      Vec2D polar = new Vec2D(radius, theta);
      float len = noise(polar.y * r) * 25;
      Vec2D circ = polar.copy().toCartesian();
      
      if (i%2 == 0) {
        stroke(i%255);
      } else {
        stroke(0);
      }
      
      strokeWeight(radius/50);
      point(circ.x/len, circ.y/len, radius);
    }
    popMatrix();
  }
}

