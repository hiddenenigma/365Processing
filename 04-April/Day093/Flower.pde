class Flower {
  int angle;
  PVector loc;
  float s;
  float c;
  
  Flower(float x, float y, float s_, float c_) {
    angle = 0;
    loc = new PVector(x,y);
    s = s_;
    c = c_;
  }
  
  void display() {
    fill(c);
    angle += 5;
    float val = cos(radians(angle)) * 10.0;
    for (int a = 0; a < 360; a += s) {
      float xoff = cos(radians(a)) * val;
      float yoff = sin(radians(a)) * val;
      ellipse(loc.x + xoff, loc.y + yoff, val/2, val/2);
    }
    ellipse(loc.x, loc.y, 2, 2);
  }
}
