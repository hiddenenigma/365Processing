class SquareSmall {
  PVector loc;
  PVector vel;
  float sw;
  float v = .005;
  
  SquareSmall(float x, float y, float sw_) {
    loc = new PVector(x,y);
    vel = new PVector(random(-v,v),random(-v,v));
    sw = sw_;
  }
  
  void display() {
    for (int i = 0; i < 10; i +=2) {
      stroke(random(255));
      strokeWeight(sw);
      rect(loc.x,loc.y,i,i);
    }
  }
}
