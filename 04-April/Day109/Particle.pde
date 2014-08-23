// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Particle{
  
  PVector location;
  PVector vel;
  PVector acc;
  float mass; 
  float weight;
  float lifespan;
  
  Particle(PVector l, float m, float w) {
    location = l.get();
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    mass = m;
    weight = w;
    lifespan = 255;
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
