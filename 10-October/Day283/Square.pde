class Square {

  PVector loc;
  float d;
  float theta = 0;
  
  Square(PVector l, float d_) {
    loc = l.get();
    d = d_;
  }

  void display() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(theta);
    strokeWeight(5);
    rect(0, 0, d, d);
    if (d%2 == 0) {
      stroke(0);
      theta-= 0.01;
    } else {
      stroke(255);
      theta += 0.01;
    }
    popMatrix();
  }
}

