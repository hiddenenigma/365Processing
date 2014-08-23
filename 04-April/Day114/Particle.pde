// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  float lifespan;


  Particle(PVector l) {
    acc = new PVector(0,0.05);
    vel = new PVector(random(-1,1),random(-2,0));
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
    lifespan -= 2;
  }

  void display() {
    fill(0,lifespan);
    ellipse(loc.x,loc.y,8,8);
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
