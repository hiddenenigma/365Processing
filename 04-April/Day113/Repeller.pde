// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Repeller {
  float strength = 100;
  PVector loc;
  float r = 1;
  
  Repeller(PVector l) {
   loc = l.get();
  }
  
  void display() {
    noStroke();
    noFill();
    ellipse(loc.x, loc.y, r*2, r*2);
  }
  
  PVector repel(Particle p) {
    PVector dir = PVector.sub(loc,p.loc);
    float d = dir.mag();
    d = constrain(d,2,100);
    float force = -0.004 * strength / (d*d);
    dir.mult(force);
    return dir;
  }
}
