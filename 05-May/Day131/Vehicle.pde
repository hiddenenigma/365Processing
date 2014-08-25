// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Vehicle {
  PVector loc, vel, acc;
  float maxspeed, maxforce;
  float r;
  float r2;


  Vehicle(float x, float y) {
    acc = new PVector(0, 0);
    vel = new PVector(0, 0);
    loc = new PVector(x, y);
    maxspeed = 2;
    maxforce = 0.05;
    r = 4;
    r2 = 20;
  }

  void run() {
    update();
    display();
    borders();
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
    separate.mult(1.2);
    applyForce(separate);

  }


  PVector separate (ArrayList<Vehicle> vehicles) {
    float desiredseparation = r*5.5; 
    PVector sum = new PVector();
    int count = 0;
    for (Vehicle other : vehicles) {

      float d = PVector.dist(loc, other.loc);
      if (d < 15) {
        stroke(0, 120-d);
        line(loc.x, loc.y, other.loc.x, other.loc.y);
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
      sum.sub(vel);
      sum.limit(maxforce);
    }
    return sum;
  }


  void seek(PVector target) {
    PVector desired = PVector.sub(target, loc); 
    
    if (desired.mag() == 0) return;

    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxforce);  
    applyForce(steer);
  }

  void display() {
    noStroke();
    pushMatrix();
    translate(loc.x, loc.y);
    fill(255);
    popMatrix();
  }

  void borders() {
    if (loc.x < -r2) loc.x = width+r2;
    if (loc.y < -r2) loc.y = height+r2;
    if (loc.x > width+r2) loc.x = -r2;
    if (loc.y > height+r2) loc.y = -r2;
  }
}
