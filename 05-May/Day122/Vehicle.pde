// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Vehicle {
  PVector loc, vel, acc;
  float maxspeed, maxforce;
  float r = 50;
  float radius;
  float c;
  
  
  Vehicle(float x, float y, float c_, float radius_) {
    acc = new PVector(0,0);
    vel = new PVector(0,0);
    loc = new PVector(x,y);
    maxspeed = 10;
    maxforce = 0.5;
    c=c_;
    radius = radius_;
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


  void separate (ArrayList<Vehicle> vehicles) {

    float desiredseparation = r*2; 
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

    fill(255);
    noStroke();
    pushMatrix();
    translate(loc.x,loc.y);
    ellipse(0,0,radius,radius);
    popMatrix();
  }
}
