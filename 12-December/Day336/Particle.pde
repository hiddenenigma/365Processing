class Particle {
  PVector loc, vel, acc, target;
  float maxLife, life, lifeRate, maxSpeed, maxForce;
  float r, c;

  Particle(float x, float y, float c_) {
    loc = new PVector(x,y);
    vel = new PVector();
    acc = new PVector();    
    r = random(5) + 1;
    c = c_;
    getPosition();
    maxLife = 255; 
    life = random(0.2 * maxLife, maxLife);
    lifeRate = random(0.03, 0.06);
    maxForce = 10;
    maxSpeed = 0.1;
  }

  void update() {
    loc.x += random(-0.5,0.5);
    loc.y += random(-0.5,0.5);
    maxSpeed += 0.005;
    loc.add(vel);
    vel.add(acc);
    vel.limit(maxSpeed + 0.7);
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
      maxSpeed = 0;
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

  void display(ArrayList<Particle> particles) {
    for (Particle other: particles) {
      float d = PVector.dist(loc, other.loc);   
      if (d < 50) {
        stroke(d, 50-d);
        line(loc.x, loc.y, other.loc.x, other.loc.y);
      } 
    }
    noStroke();
    fill(0, life);
    ellipse(loc.x,loc.y, r, r);    
  }
  
  void getPosition() {
    while (target == null || !isInText (target)) target = new PVector(random(width), random(height));
  }

  boolean isInText(PVector v) {
    return pg.get(int(v.x), int(v.y)) == pgraphics_color;
  }
}

