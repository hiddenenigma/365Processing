class Square {
  PVector loc;
  PVector vel;
  float sw;
  float v = .1;
  
  Square(float x, float y, float sw_) {
    loc = new PVector(x,y);
    vel = new PVector(random(-v,v),random(-v,v));
    sw = sw_;
  }
  
  void display() {
    loc.add(vel);
    for (int i = 0; i < 30; i +=5) {
      stroke(random(255));
      strokeWeight(sw);
      fill(0);
      rect(loc.x,loc.y,i,i);
    }
  }
}
