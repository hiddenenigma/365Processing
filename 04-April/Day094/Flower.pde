class Flower {
  int angle;
  PVector loc;
  PVector vel;
  float s;
  float c;
  
  Flower(float x, float y, float s_, float c_) {
    angle = 0;
    loc = new PVector(x,y);
    vel = new PVector(random(-1,1), 1);
    s = s_;
    c = c_;
  }
  void update() {
    loc.add(vel);
  }
  
  void display() {
    if (mousePressed) {
    angle += 2;
    float val = cos(radians(angle)) * 25.0;
    for (int a = 0; a < 360; a += 35) {
      float xoff = cos(radians(a)) * val;
      float yoff = sin(radians(a)) * val;
      ellipse(mouseX + xoff, mouseY + yoff, val/2, val/2);

      }
    }
  }
}
