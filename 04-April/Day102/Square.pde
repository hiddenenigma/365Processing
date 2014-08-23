class Square {
  PVector loc;
  PVector vel;
  float s = 4;
  float v = .1;
  float c;

  Square(float x, float y, float c_) {
    loc = new PVector(x,y);
    vel = new PVector(random(-v,v),random(-v,v));
    c = c_;
  }

  void display() {
//    loc.add(vel);
    strokeWeight(mouseX/50);
    stroke(c);
    line(mouseX, mouseY, loc.x,loc.y);
    fill(0);
    noStroke();
    ellipse(loc.x,loc.y,s,s);
  }
}
