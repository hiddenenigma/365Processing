// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Vehicle {
  PVector loc, vel, acc;
  float maxspeed, maxforce;
  float r = 5;
  
  Vehicle(float x, float y) {
    acc = new PVector(0,0);
    vel = new PVector(0,0);
    loc = new PVector(x,y);
    maxspeed = 10;
    maxforce = 0.002;
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
  
  void flee(PVector target) {
    PVector desired = PVector.sub(loc,target);
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.add(desired,vel);
    steer.limit(maxforce);
    applyForce(steer);
  }

  void separate (ArrayList<Vehicle> vehicles) {

    float desiredseparation = r*2; //[bold]
    PVector sum = new PVector();
    int count = 0;
    for (Vehicle other : vehicles) {
      float d = PVector.dist(loc, other.loc);
      if ((d > 0) && (d < desiredseparation)) {
        PVector diff = PVector.sub(loc, other.loc);
        diff.normalize();

        diff.div(d);  //[bold]
        sum.add(diff);
        count++;

      }
    }
    if (count > 0) {
      sum.div(count);
      sum.normalize();
      sum.mult(maxspeed);
      PVector steer = PVector.sub(sum, vel);
      steer.limit(maxforce);
      applyForce(steer);
    }

  }
  
  void display() {
    float theta = vel.heading() + TWO_PI/2;
    float r = map(loc.z,0,100,1.5,10);

    stroke(0);
    strokeWeight(r);
    fill(0);
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(theta);
    fill(0);
    line(0,0,10,10);
    popMatrix();
  }
}
