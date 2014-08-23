// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Particle {
  
  PVector location;
  PVector vel;
  PVector acc;
  float mass; // Diameter of the ring
  boolean on = false; // Turns the display on and off
  float weight;
  float lifespan;
  float ls;
  float c;
  
  Particle(PVector l, float m, float w, float c_) {
    location = l.get();
    vel = new PVector(random(-1,1),random(-1,1));
    acc = new PVector(0,0);
    on = true;
    mass = m;
    weight = w;
    lifespan = 255;
    c=c_;
  }
  
   void applyForce(PVector force) {
    acc.add(force);
  }
  
  void run() {
    update();
    display();
  }
  
  void update() {
    lifespan -= 1;
    location.add(vel);
    vel.add(acc);
  }
  
  void display() {
      noFill();
      strokeWeight(weight);
      stroke(0, lifespan);
      ellipse(location.x, location.y, mass, mass);
      mass += 1.5;
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
