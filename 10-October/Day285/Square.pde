class Square {

  PVector loc;
  float d;
  float theta;

  Square(PVector l, float d_, float theta_) {
    loc = l.get();
    d = d_;
    theta = theta_;
  }

  void display() {
    pushMatrix();

    translate(loc.x, loc.y);
    rotate(theta);
    strokeWeight(5);
    rect(0, 0, d, d);
    if (d%2 == 0) {
      stroke(255);
      theta+= 0.01;
    } else {
      stroke(0);
      theta -= 0.01;
    }
    popMatrix();
  }
}

