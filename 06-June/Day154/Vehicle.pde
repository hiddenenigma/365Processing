// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Vehicle {

  PVector loc, vel, acc;
  float maxforce, maxspeed;
  float c, r;

  Vehicle(PVector l, float ms, float mf, float c_, float r_) {
    loc = l.get();
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    maxspeed = ms;
    maxforce = mf;
    c=c_;
    r = r_;
  }

  void run() {
    update();
    borders();
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

    fill(c);
    noStroke();
    pushMatrix();
    translate(loc.x, loc.y);
    ellipse(0, 0, r, r);
    popMatrix();
  }

  void borders() {
    if (loc.x < -r) loc.x = width+r;
    if (loc.y < -r) loc.y = height+r;
    if (loc.x > width+r) loc.x = -r;
    if (loc.y > height+r) loc.y = -r;
  }
}

