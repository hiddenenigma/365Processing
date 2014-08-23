// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Particle {
  
  PVector location;
  PVector vel;
  PVector acc;
  float mass; 
  boolean on = false; 
  float lifespan;
  float ls;
  float c;
  
  Particle(PVector l, float m, float c_, float ls_) {
    location = l.get();
    vel = new PVector(random(-1,1),random(-1,1));
    acc = new PVector(0,0);
    on = true;
    mass = m;
    lifespan = 255;
    c=c_;
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
    lifespan -= ls;
    location.add(vel);
    vel.add(acc);
  }
  
  void display() {
      fill(c, lifespan);
      noStroke();
      ellipse(location.x, location.y, mass, mass);
      mass += 0.2;
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
