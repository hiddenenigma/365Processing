// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin, vel, acc;
  float lifespan = 255;
  float ls;

  ParticleSystem(PVector loc, float ls_) {
    origin = loc.get();
    vel = new PVector(random(-0.5, 0.5), random(-0.5, 0.5));
    acc = new PVector(random(-0.6, 0.6), random(-0.6, 0.6));
    particles = new ArrayList<Particle>();
    ls = ls_;
  }

  void addParticle() {
    origin.add(vel);
    vel.add(acc);
    acc.mult(0);
    particles.add(new Particle(origin, random(200, 255), random(5, 20), 0.5));
  }

  void applyForce(PVector f) {
    for (Particle p : particles) {
      p.applyForce(f);
    }
  }

  void run() {
    lifespan -= ls;
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext ()) {
      Particle p = it.next();
      p.run();
      if (p.isDead()) {
        it.remove();
      }
    }
  }
  
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}

