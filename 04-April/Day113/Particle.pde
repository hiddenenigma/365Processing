// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Particle {
  
  PVector loc;
  PVector vel;
  PVector acc;
  float mass; 
  boolean on = false; 
  float lifespan;
  float ls;
  float c;
  float sw;

  
  Particle(PVector l, float m, float c_, float ls_, float sw_) {
    loc = l.get();
    vel = new PVector(random(-1,1),random(-1,1));
    acc = new PVector(random(-0.01,0.01),random(-0.01,0.01));
    on = true;
    mass = m;
    lifespan = 255;
    c=c_;
    ls = ls_;
    sw = sw_;
  }
  
  void applyForce(PVector force) {
    acc.add(force);
  }
  
  void run() {
    update();
    display();
  }
  
  void update() {
    lifespan -= ls;
    loc.add(vel);
    vel.add(acc);
  }
  
  void display() {

      fill(0,lifespan);
      noStroke();
      ellipse(loc.x, loc.y, mass,mass);
      stroke(0,40);
      strokeWeight(sw);
      line(loc.x,loc.y,width/2, height/2);
      mass += 0.3;
      sw = noise(frameCount * 0.02) * 1;

    }
  
  
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}
