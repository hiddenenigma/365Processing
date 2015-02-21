// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Particle {
  PVector loc, vel, acc;
  float lifespan;  
  float ls, sw;
  
  Particle(PVector l, float ls_, float sw_) {
    loc = l.get();
    vel = new PVector(random(-0.3,0.13), random(-0.3,0.3));
    acc = new PVector(random(-0.05,0.05),random(-0.05,0.05));
    lifespan = 255;
    sw = sw_;
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
    translate(loc.x, loc.y);
    stroke(255,10);
    strokeWeight(sw);
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
