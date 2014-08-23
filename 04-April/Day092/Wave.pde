class Wave {
  PVector location;
  float startAngle;
  float angleVel;
  float sw;
  float m;
  float c;
  float f;

  Wave(float sa, float av, float sw_, float m_, float c_, float f_) {
    startAngle = sa;
    angleVel = av;
    m = m_;
    sw = sw_;
    c = c_;
    f = f_;
  }
  
  void display() {
    pushMatrix();
    translate(width/2, height/2);
    rotateZ(theta);
    float angle = startAngle;
    startAngle += 0.02;
    strokeWeight(sw);
    stroke(f);
    for (int x = 0; x <= width; x += 5) {
      float y = map(cos(angle), -1, 1, 0, 200);
      point(x, y);
      angle += .01;
    }
    theta += 0.001;
    popMatrix();
  }
}
