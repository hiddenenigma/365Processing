// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com


class Vehicle {

  PVector location, velocity, acceleration;
  float maxforce, maxspeed;
  float r;

  Vehicle(PVector l, float ms, float mf, float r_) {
    location = l.get();
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    maxforce = mf;
    maxspeed = ms;
    r = r_;
  }

  public void run() {
    update();
    display();
  }

  void follow(FlowField flow) {
    PVector desired = flow.lookup(location);
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);  
    applyForce(steer);
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    fill(0);
    noStroke();
    pushMatrix();
    translate(location.x, location.y);
    ellipse(0, 0, r, r);
    popMatrix();
  }
}

