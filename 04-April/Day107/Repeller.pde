// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Repeller {
  float strength = 300;
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
    float radius = noise(frameCount * 0.01) * 5;

    PVector dir = PVector.sub(loc,p.loc);
    float d = dir.mag();
    d = constrain(d,2,300);
    float force = -radius * strength / (d*d);
    dir.mult(force);
    return dir;
  }
}
