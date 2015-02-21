// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Vehicle {

  PVector loc, vel, acc;
  float maxspeed, maxforce;
  float c, r;

  Vehicle(PVector l, float ms, float mf, float c_, float r_) {
    loc = l.get();
    vel = new PVector(0, 0);    
    acc = new PVector(0, 0);
    maxspeed = ms;
    maxforce = mf;
    c = c_;
    r = r_;
  }

  void run() {
    update();
    display();
  }

  void follow(FlowField flow) {
    PVector desired = flow.lookup(loc);
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxforce);  
    applyForce(steer);
  }

  void applyForce(PVector force) {
    acc.add(force);
  }
  
  void update() {
    vel.add(acc);
    vel.limit(maxspeed);
    loc.add(vel);
    acc.mult(0);
  }

  void display() {
    stroke(c);
    pushMatrix();
    translate(loc.x, loc.y);
    line(0, 0, r, 0);
    popMatrix();
  }
}

