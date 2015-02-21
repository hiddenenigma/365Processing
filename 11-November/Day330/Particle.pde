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

  void display() {
    pushMatrix();
    translate(x, y);
    rotate(theta);
    for (int i = 0; i < 360*2; i += 3) {
      float theta = radians(i);
      Vec2D polar = new Vec2D(radius, theta);
      float len = noise(polar.y * 1.5) * (10);
      Vec2D circ = polar.copy().toCartesian();
      
      if (i%2 == 0) {
        strokeWeight(1);
        stroke(0);
        theta += 0.001;
      } else {
        stroke(255);
        theta -= 0.001;
      }    
      
      line(circ.x-len, circ.y+len, len/2, len/2);
    }
    popMatrix();
    theta+= 0.01;
    radius+=0.1;
  }
}

