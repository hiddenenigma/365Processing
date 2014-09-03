// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Vehicle {
  PVector loc, vel, acc;
  float maxspeed, maxforce;
  float r;
  float radius;

  
  Vehicle(float x, float y) {
    loc = new PVector(x,y);
    vel = new PVector(0,0); 
    acc = new PVector(0,0);    
    maxspeed = 3;
    maxforce = 0.1;
    r = 12;
  }
  
  void run() {
    update();
    borders();
  }
  
  void update() {
    vel.add(acc);
    vel.limit(maxspeed);
    loc.add(vel);
    acc.mult(0);
  }
  
  void applyBehaviors(ArrayList<Vehicle> vehicles) {
    PVector separate = separate(vehicles);
    separate.mult(1.2);
    applyForce(separate);
  }
  
  void applyForce(PVector force) {
    acc.add(force);
  }

  PVector separate (ArrayList<Vehicle> vehicles) {

    float desiredseparation = r*1.1; 
    PVector sum = new PVector();
    int count = 0;
    for (Vehicle other : vehicles) {
      float d = PVector.dist(loc, other.loc);
      if (d < 6) {
        stroke(255, 100-d);
        line(loc.x,loc.y,other.loc.x,other.loc.y);
      }
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
      sum.limit(maxforce);
    }
    return sum;
  }

  void follow(FlowField flow) {
    PVector desired = flow.lookup(loc);
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxforce);
    applyForce(steer);
  }  

  void borders() {
    if (loc.x < -r) loc.x = width+r;
    if (loc.y < -r) loc.y = height+r;
    if (loc.x > width+r) loc.x = -r;
    if (loc.y > height+r) loc.y = -r;
  }
}
