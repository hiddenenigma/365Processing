class Flower {
  int angle;
  PVector loc;
  PVector vel;
  float s;
  float c;
  
  Flower(float x, float y, float s_, float c_) {
    angle = 0;
    loc = new PVector(x,y);
    vel = new PVector(random(-1,1), random(-1,1));
    s = s_;
    c = c_;
  }
  
  void display() {
    loc.add(vel);
    angle += 1;
    float val = sin(radians(angle)) * c;
    for (int a = 0; a < 360; a += s) {
      float xoff = cos(radians(a)) * val;
      float yoff = sin(radians(a)) * val;
      fill(random(255));
      ellipse(loc.x + xoff, loc.y + yoff, val/2, val/2);
      
    }
  }
    void checkEdges() {
    if (loc.x > width) {
      loc.x = width;
      vel.x *= -1;
    } else if (loc.x < 0) {
      vel.x *= -1;
      loc.x = 0;
    }

    if (loc.y > height) {
      vel.y *= -1;
      loc.y = height;
    } else if (loc.y < 0) {
      vel.y *= -1;;
      loc.y = 0;
    }
  }
}
