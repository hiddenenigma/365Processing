// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Particle {
  PVector loc, vel, acc;
  float angle, aVel, aAcc;
  float lifespan;  

  Particle(PVector l) {
    loc = l.get();
    vel = new PVector(random(-0.1, 0.1), random(-0.1, 0.1));
    acc = new PVector(random(-0.05, 0.05), random(-0.05, 0.05));
    angle = 0.0;
    aVel = 0.0;
    aAcc = acc.x;
    lifespan = 255;    
  }

  void run() {
    update();
    display();
  }

  void update() {
    vel.add(acc);
    loc.add(vel);
    aAcc = acc.x;
    aVel += aAcc;
    aVel = constrain(aVel, -0.04, 0.04);
    angle += aVel;
    acc.mult(0);
    lifespan -= 2.0;
  }

  void display() {
    fill(255, lifespan);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(angle);
    int nbr_circles = (int)map(mouseY, 0, height, 5, 50);
    float lg_d = map(mouseY, 0, height, 1, 350);
    float lg_r = lg_d/2;
    float lg_circ = PI * lg_d;
    float sm_d = lg_circ / nbr_circles;
    for (int i = 1; i <= nbr_circles; ++i) {
      float angle = i * TWO_PI / nbr_circles;
      float x = cos(angle) * lg_r;
      float y = sin(angle) * lg_r;
      ellipse(x, y, sm_d, sm_d);
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

