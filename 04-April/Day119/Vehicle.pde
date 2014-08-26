// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Vehicle {
  PVector loc, vel, acc;
  float maxspeed;
  float maxforce;
  
  Vehicle(float x, float y, float z) {
    acc = new PVector(0,0);
    vel = new PVector(0,0);
    loc = new PVector(x,y,z);
    maxspeed = 10;
    maxforce = 0.005;
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
    PVector desired = PVector.sub(loc,target);
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.add(desired,vel);
    steer.limit(maxforce);
    applyForce(steer);
  }
  
  void display() {
    float theta = vel.heading() + PI/2;
    float r = map(loc.z,0,1500,2,10);
    noFill();
    stroke(0);
    strokeWeight(r);
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(theta);
    beginShape();
    vertex(0, 0);
    vertex(5, 5);
    vertex(10,0);
    endShape();
    popMatrix();
  }
}
