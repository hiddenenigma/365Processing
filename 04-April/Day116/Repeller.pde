// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Repeller {
  float strength = 10;
  PVector loc;
  float r = 10;
  PVector vel;
  
  Repeller(PVector l) {
   loc = l.get();
   vel = new PVector(random(-1,1),random(-1,1));
  }
  
  void display() {
    noStroke();
    noFill();
    ellipse(loc.x, loc.y, r*2, r*2);
  }
  
  PVector repel(Particle p) {
    PVector dir = PVector.sub(loc,p.loc);
    float d = dir.mag();
    dir.normalize();
    d = constrain(d,2,5);
    float force = 1 * strength / (d*d);
    dir.mult(force);
    return dir;
  }
}
