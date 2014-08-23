// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  float lifespan;
  float mass = 0.001;
  float ls;

  Particle(PVector l) {
    acc = new PVector(0,0.05);
    vel = new PVector(random(-1,1),random(-1,2));
    loc = l.get();
    lifespan = 255;
    ls = random(1,5);
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
    lifespan -= ls;
  }

  void display() {

    fill(255,lifespan);
    ellipse(loc.x,loc.y,mass,mass);
    mass += 0.08;
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
