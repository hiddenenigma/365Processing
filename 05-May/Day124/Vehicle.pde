// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Vehicle {
  PVector loc, vel, acc;
  float maxspeed, maxforce;
  float r = 15;
  
  
  Vehicle(float x, float y) {
    acc = new PVector(0,0);
    vel = new PVector(0,0);
    loc = new PVector(x,y);
    maxspeed = 3;
    maxforce = 0.1;
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
  
  void applyBehaviors(ArrayList<Vehicle> vehicles) {
    PVector separate = separate(vehicles);
    PVector seek = seek(new PVector(width/2,height/2));
    applyForce(separate);
    applyForce(seek);
  }


  PVector separate (ArrayList<Vehicle> vehicles) {
    float desiredseparation = r*10; 
    PVector sum = new PVector();
    int count = 0;
    for (Vehicle other : vehicles) {
      float d = PVector.dist(loc, other.loc);
      if ((d > 0) && (d < desiredseparation)) {
        PVector diff = PVector.sub(loc, other.loc);
        diff.normalize();
        diff.div(d);
        sum.add(diff);
        count++;

      }
    }
    if (count > 0) {
      sum.div(count);
      sum.normalize();
      sum.mult(maxspeed);
      sum.sub(vel);
      sum.limit(maxforce);
    }
    return sum;
  }
  
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target,loc);
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired,vel);
    steer.limit(maxforce);
 
    return steer;
  }
  
  void display() {
    float theta = vel.heading() + TWO_PI/2;
    fill(255);
    stroke(255);
    strokeWeight(1);
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(theta);
    line(0,0,0,5);
    popMatrix();
  }
}
