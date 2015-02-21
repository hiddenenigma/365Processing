// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Boid {

  PVector location, velocity, acceleration;
  float maxforce, maxspeed;
  float len;

  Boid(float x, float y, float mf) {
    location = new PVector(x,y);
    velocity = new PVector(0, 0); 
    acceleration = new PVector(0, 0);
    maxforce = mf;
    maxspeed = 0;
    len = 2;
  }

  void run(ArrayList<Boid> boids) {
    flock(boids);
    update();
    borders();
    display();
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void flock(ArrayList<Boid> boids) {
    PVector sep = separate(boids);
    PVector ali = align(boids);
    PVector coh = cohesion(boids);
    
    sep.mult(1.5);
    ali.mult(1.0);
    coh.mult(1.0);
    
    applyForce(sep);
    applyForce(ali);
    applyForce(coh);
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
    maxspeed = frameCount * 0.01;
  }
  
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target,location);
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired,velocity);
    steer.limit(maxforce);
    return steer;
  }
 
  void display() {
    float theta = velocity.heading() + PI/2;
    stroke(0);
    pushMatrix();
    translate(location.x,location.y);
    rotate(theta);
    beginShape();
    line(0,0,0,len*20);
    line(0,0,len*20,0);
    endShape(CLOSE);
    popMatrix();
  }

  // Wraparound
  void borders() {
    if (location.x < -len) location.x = width+len;
    if (location.y < -len) location.y = height+len;
    if (location.x > width+len) location.x = -len;
    if (location.y > height+len) location.y = -len;
  }
  
  PVector separate (ArrayList<Boid> boids) {
    float desiredseparation = len*2;
    PVector sum = new PVector(0,0);
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(location, other.location);  
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
      sum.sub(velocity);
    }
    return sum;
  }
  
  PVector align(ArrayList<Boid> boids) {
    float neighbordist = 50;
    PVector sum = new PVector(0,0);
    int count = 0;
    for (Boid other: boids) {
      float d = PVector.dist(location, other.location);  
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.velocity);
        count ++;
      }
    }
    if (count > 0) {
      sum.div(count);
      sum.normalize();
      sum.mult(maxspeed);    
      PVector steer = PVector.sub(sum,velocity);
      steer.limit(maxforce);
      return steer;
    } else {
      return new PVector(0,0);
    }
  }
  
  PVector cohesion (ArrayList<Boid> boids) {
    float neighbordist = 50;
    PVector sum = new PVector(0,0);
    int count = 0;
    for (Boid other: boids) {
      float d = PVector.dist(location,other.location);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.location);
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      return seek(sum);
    } else { 
      return new PVector(0,0);
    }
  }

}

