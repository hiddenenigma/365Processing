// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Particle {
  PVector loc, vel, acc;
  float lifespan, ls;
  
  Particle(PVector l, float ls_) {
    loc = l.get();
    vel = new PVector(random(-1,1), random(-1,1));
    acc = new PVector(random(-0.05,0.05),random(-0.05,0.05));
    lifespan = 255;
    ls = ls_;
  }
  
  void run() {
    update();
    display();
  }
  
  void update() {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
    lifespan -= ls;
  }
  
  void display() {
    pushMatrix();
    translate(loc.x,loc.y);
    stroke(255,lifespan);
    point(0,0);
    popMatrix();
  }
  
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
