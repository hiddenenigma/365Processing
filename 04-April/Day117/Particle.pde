// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  float lifespan;
//  float mass = 3;
  float ls;

  Particle(PVector l) {
    acc = new PVector(0,0);
    vel = new PVector(0,random(-2,0));
    loc = l.get();
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
    vel.add(acc);
    loc.add(vel);
//    acc.mult(0);
    lifespan -= 2;
  }

  void display() {
    float c = map(loc.y,0,height,0,255);
    fill(255);
    ellipse(loc.x,loc.y,1,1);
//    mass -= 0.2;
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
