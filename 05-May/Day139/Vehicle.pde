// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com


class Vehicle {

  PVector location, velocity, acceleration;
  float maxforce, maxspeed;
  float r, c;

    Vehicle(PVector l, float ms, float mf, float c_) {
    location = l.get();
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    
    maxspeed = ms;
    maxforce = mf;
    
    r = 2.0;    
    c=c_;
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
  
  void separate (ArrayList<Vehicle> vehicles) {
    float desiredseparation = r*5;
    PVector sum = new PVector();
    int count = 0;
    for (Vehicle other : vehicles) {
      float d = PVector.dist(location, other.location);  
      if (d < 5) {
        stroke(255, 10);
        line(location.x, location.y, other.location.x, other.location.y);
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
 

  void display() {
    float theta = velocity.heading2D() + radians(90);
    stroke(0,50);
    pushMatrix();
    translate(location.x,location.y);
    rotate(theta);
    line(0,0,0,10);
    popMatrix();
  }

  void borders() {
    if (location.x < -r) location.x = width+r;
    if (location.y < -r) location.y = height+r;
    if (location.x > width+r) location.x = -r;
    if (location.y > height+r) location.y = -r;
  }
}

