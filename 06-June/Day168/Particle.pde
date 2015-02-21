// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Particle {
  PVector loc, vel, acc;
  float r, lifespan, ls, c;


  Particle(PVector l, float c_, float ls_, float r_) {
    loc = l.get();
    vel = new PVector(random(-0.5, 0.5), random(-0.5, 0.5));
    acc = new PVector(random(-0.05, 0.05), random(-0.05, 0.05));
    r = r_;
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
    fill(c, lifespan-50);
    noStroke();
    float angle = vel.heading() + PI/2;
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(angle);
    ellipse(0, 0, r, r);
    popMatrix();
    r+=0.1;
  }

  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}

