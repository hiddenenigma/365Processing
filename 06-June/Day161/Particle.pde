// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Particle {
  PVector loc, vel, acc;
  float mass, lifespan, ls, c;
  
  Particle(PVector l, float c_, float ls_, float mass_) {
    loc = l.get();
    vel = new PVector(random(-0.5,0.5), random(-0.5,0.5));
    acc = new PVector(random(-0.005,0.005),random(-0.005,0.005));
    mass = mass_;
    lifespan = 255;
    c = c_;
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
    fill(c,lifespan);
    noStroke();
    float angle = vel.heading() + PI/2;
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(angle);
    beginShape();
    vertex(0,0);
    vertex(mass,0);
    vertex(mass,-mass);
    endShape(CLOSE);
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
