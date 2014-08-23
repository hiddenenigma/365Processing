class Wave {
  PVector location;
  float startAngle;
  float angleVel;
  float sw;
  float m;
  float c;

  Wave(float sa, float av, float sw_, float m_, float c_) {
    startAngle = sa;
    angleVel = av;
    m = m_;
    sw = sw_;
    c = c_;
  }

  void display() {
    float angle = startAngle;
    startAngle += 0.01;
    strokeWeight(sw);
    for (int x = 0; x <= width; x += c) {
      float y = map(cos(angle), -m, m, 0, height);
      point(x, y);
      angle += angleVel;
    }
  }
}
