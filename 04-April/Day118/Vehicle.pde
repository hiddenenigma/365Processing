// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Vehicle {
  PVector loc, vel, acc;
  float maxspeed;
  float maxforce;
  float minspeed, minforce;
  
  Vehicle(float x, float y, float z) {
    acc = new PVector(0,0);
    vel = new PVector(0,0);
    loc = new PVector(x,y,z);
    maxspeed = 10;
    maxforce = 0.01;
    minspeed = 0.001;
    minforce = 0.001;
  }
  
  void run() {
    update();
    display();
  }
  
  void update() {
    vel.add(acc);
    vel.limit(maxspeed);
    loc.add(vel);
    acc.mult(0);
  }
  
  void applyForce(PVector force) {
    acc.add(force);
  }
  
  void seek(PVector target) {
    PVector desired = PVector.sub(target,loc);
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired,vel);
    steer.limit(maxforce);
    applyForce(steer);
  }
  
  void flee(PVector target) {
    PVector desired = PVector.add(loc,target);
    desired.normalize();
    desired.mult(minspeed);
    PVector steer = PVector.add(desired,vel);
    steer.limit(minforce);
    applyForce(steer);
  }
  
  void display() {
    float theta = vel.heading() + PI/2;
    float r = map(0,loc.z,width,3,15);
    fill(0);
    stroke(0);
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(theta);
    ellipse(0,0,r,r);
    ellipse(5,5,r,r);
    line(0,0,5,5);
    popMatrix();
  }
}
