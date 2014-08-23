// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  float lifespan;
  float radius;
  float c;
  float ls;

  Particle(PVector l, float c_, float radius_, float ls_) {
    loc = l.get();
    vel = new PVector(random(-1, 1), random(-3,2));
    acc = new PVector(random(-0.01,0.01), random(-0.01,0.01));
    lifespan = 255;
    c = c_;
    radius = radius_;
    ls = ls_;
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void run() {
    update();
    display();
  }

  void update() {
    loc.add(vel);
    vel.add(acc);
    acc.mult(0);
    lifespan -= ls;
  }

  void display() {
    noStroke();
    fill(255, lifespan);
    ellipse(loc.x, loc.y, radius, radius);
  }

  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}
