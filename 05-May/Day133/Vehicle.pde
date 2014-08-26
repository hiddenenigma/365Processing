// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Vehicle {

  PVector location, velocity, acceleration;
  float maxforce, maxspeed;   
  float c, r;

  Vehicle(PVector l, float ms, float mf, float c_) {
    location = l.get();
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    maxspeed = ms;
    maxforce = mf;
    c=c_;
    r = 3.0;

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
  
  void separate (ArrayList<Vehicle> vehicles) {
    float desiredseparation = r*2;
    PVector sum = new PVector();
    int count = 0;
    for (Vehicle other : vehicles) {
      float d = PVector.dist(location, other.location);
      if (d < 40) {        
        stroke(0,50-d);
        line(location.x,location.y,other.location.x,other.location.y);
      }
      if ((d > 0) && (d < desiredseparation)) {
        PVector diff = PVector.sub(location, other.location);
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
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxforce);
      applyForce(steer);
    }
  }
}

