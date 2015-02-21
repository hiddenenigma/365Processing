// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Particle {
  PVector loc, vel, acc;
  float lifespan;  
  float ls, s, sw;
  float r;

  Particle(PVector l, float ls_, float s_, float sw_) {
    loc = l.get();
    vel = new PVector(random(-0.2, 0.2), random(-0.2, 0.2));
    acc = new PVector(random(-0.05, 0.05), random(-0.05, 0.05));
    lifespan = 255;
    s = s_;
    sw = sw_;
    r=1;
  }

  void run() {
    update();
    display();
  }

  void update() {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
    lifespan -= ls;

  }

  void display() {
    pushMatrix();
    translate(loc.x, loc.y);
    stroke(s, lifespan-150);
    strokeWeight(sw);

    for (int i = 0; i < r; i++) {
      float angle = TWO_PI/i * r;
      float x = cos(angle) * r;
      float y = sin(angle) * r;
      if (r <= 3) {
        point(x, y);
        r+=0.01;
      }
    }
    popMatrix();
  }

  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}

