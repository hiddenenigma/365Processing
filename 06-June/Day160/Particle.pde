// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com


class Particle {
  PVector loc, vel, acc;
  float mass, lifespan, ls, c;
  
  Particle(PVector l, float c_, float ls_) {
    loc = l.get();
    vel = new PVector(random(-1,1), random(-1,1));
    acc = new PVector(random(-0.05,0.05),random(-0.05,0.05));
    mass = 250;
    lifespan = 255;
    ls = ls_;
    c = c_;    
  }
  
  void run() {
    update();
    display();
  }
  
  void applyForce(PVector force) {
    force.div(mass);
    acc.add(force);
  }  
  
  void update() {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
    lifespan -= ls;
  }
  
  void display() {
    pushMatrix();
    stroke(random(255),lifespan);
    point(loc.x,loc.y);
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
