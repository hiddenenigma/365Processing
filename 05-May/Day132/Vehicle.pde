// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Vehicle {

  PVector loc, vel, acc;
  float maxforce, maxspeed;    // Maximum speed
  float c, r;

    Vehicle(PVector l, float ms, float mf, float c_) {
    loc = l.get();
    vel = new PVector(0,0);
    acc = new PVector(0,0);

    maxspeed = ms;
    maxforce = mf;
    c=c_;
    r = 3.0;
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
  
  void separate (ArrayList<Vehicle> vehicles) {
    float desiredseparation = r*2;
    PVector sum = new PVector();
    int count = 0;

    for (Vehicle other : vehicles) {
      float d = PVector.dist(loc, other.loc);
      if (d < 50) {        
        stroke(c, 100-d);
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
      PVector steer = PVector.sub(sum, vel);
      steer.limit(maxforce);
      applyForce(steer);
    }
  }
 

  void display() {
    float theta = vel.heading2D() + radians(90);
    fill(0);
    noStroke();
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(theta);
    beginShape(TRIANGLES);
    endShape();
    popMatrix();
  }

  void borders() {
    if (loc.x < -r) loc.x = width+r;
    if (loc.y < -r) loc.y = height+r;
    if (loc.x > width+r) loc.x = -r;
    if (loc.y > height+r) loc.y = -r;
  }
}

