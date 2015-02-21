// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Particle {
  PVector loc, vel, acc;
  float len, lifespan, ls, c;
  
  Particle(PVector l, float c_, float ls_, float len_) {
    loc = l.get();
    vel = new PVector(random(-0.5, 0.5), random(-0.5, 0.5));
    acc = new PVector(random(-0.05, 0.05), random(-0.05, 0.05));
    len = len_;
    lifespan = 255;
    ls = ls_;
    c = c_;
  }
  
  void run() {
    update();
    display();
  }
  
  void applyForce(PVector force) {
    acc.add(force);
  }  
  
  void update() {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
    lifespan -= ls;
  }
  
  void display() {
    fill(c,lifespan);
    stroke(c,lifespan);
    float angle = vel.heading() + PI/2;
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(angle);
    line(0,0,0,len);
    popMatrix();
    len+=1;
  }
  
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
