// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Vehicle {
  PVector loc, vel, acc;
  float maxspeed, maxforce;
  float r = 50;
  float radius;
  float m;

  
  Vehicle(float x, float y, float m_) {
    acc = new PVector(0,0);
    vel = new PVector(0,0);
    loc = new PVector(x,y);
    maxspeed = 5;
    maxforce = 0.005;
    m = m_;
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
        line(loc.x,loc.y,other.loc.x,other.loc.y);
        stroke(255, d);
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
  
  void seek(PVector target) {
    PVector desired = PVector.sub(target, loc);
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired,vel);
    steer.limit(maxforce);
    applyForce(steer);
  }
  
  void display() {
    float theta = vel.heading2D() + PI/2;
    float r = map(loc.y,0,2000,1.5,8);
    fill(255);
    stroke(255);
    strokeWeight(1);
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(theta);
    line(0,0,m, m);
    ellipse(0,0,4,4);
    ellipse(m,m,4,4);
    popMatrix();
  }
}
