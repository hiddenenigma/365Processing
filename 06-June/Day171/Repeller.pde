class Repeller {
  PVector loc;
  float r;
  float strength;
  
  Repeller(float x, float y) {
    loc = new PVector(x,y);
    r = 10;
    strength = 500;
  }
  
  void display() {
    fill(255,255);
    noStroke();
    ellipse(loc.x,loc.y,r*2,r*2);
  }
  
  PVector repel(Particle p) {
    PVector dir = PVector.sub(loc, p.loc);
    float d = dir.mag();
    dir.normalize();
    d = constrain(d,1,800);
    float force = -r * strength / (d*d);
    dir.mult(force);
    return dir;
  }
}
