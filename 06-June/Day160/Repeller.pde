// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com


class Repeller {
  PVector loc;
  float r;
  float strength;
  
  Repeller(float x, float y) {
    loc = new PVector(x,y);
    r = 5;
    strength = 400;
  }
  
  void display() {
    fill(255,50);
    noStroke();
    ellipse(loc.x,loc.y,r*2,r*2);
  }  
  
  PVector repel(Particle p) {
    PVector dir = PVector.sub(loc, p.loc);
    float d = dir.mag();
    dir.normalize();
    d = constrain(d,5,500);
    float force = -1 * strength / (d*d);
    dir.mult(force);
    return dir;
  }
}
