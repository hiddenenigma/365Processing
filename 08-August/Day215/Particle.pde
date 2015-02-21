// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Particle {
  PVector loc, vel, acc, target;
  float maxLife, life, lifeRate, maxSpeed, maxForce;
  float r, c;

  Particle(float x, float y, float c_) {
    loc = new PVector(x,y);
    vel = new PVector(0,0);
    acc = new PVector(0,0);

    maxLife = 255; 
    life = random(0.2 * maxLife, maxLife);
    lifeRate = random(0.5, 1);
    maxSpeed = 0.1;
    maxForce = 10;
    
    r = random(3) + 1;
    c = c_;
    
    getPosition();
  }

  void update() {
    maxSpeed += 0.5;
    loc.add(vel);
    vel.add(acc);
    vel.limit(maxSpeed + 1.2);
    acc.mult(0);
    
    life -= lifeRate;
  }

  void applyForce(PVector force) {
    acc.add(force);
  }
  
  void seek() {
    PVector desired = PVector.sub(target,loc);
    desired.normalize();
    desired.mult(maxSpeed);
    PVector steer = PVector.sub(desired,vel);
    steer.limit(maxForce);
    applyForce(steer);
    float d = PVector.dist(target,loc);
    if (d < 1) {
      maxSpeed = 0.05;
    }
  }

  void arrive() {
    PVector desired = PVector.sub(target,loc);
    float d = desired.mag();
    desired.normalize();
    if (d < 100) {
      float m = map(d,0,100,0,maxSpeed);
      desired.mult(m);
    } else {
      desired.mult(maxSpeed);
    }
    PVector steer = PVector.sub(desired,vel);
    steer.limit(maxForce);
    applyForce(steer);
  }

  void display() {
    noStroke();
    fill(c, life);
    ellipse(loc.x,loc.y,r,r);    
  }
  
  void getPosition() {
    while (target == null || !isInText (target)) target = new PVector(random(width), random(height));
  }

  boolean isInText(PVector v) {
    return pg.get(int(v.x), int(v.y)) == PGRAPHICS_COLOR;
  }
}

