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
    vel = new PVector(0.3, 0);
    acc = new PVector(0.3, 0);
    particles = new ArrayList<Particle>();
    ls=ls_;
  }

  void addParticle() {
    origin.add(vel);
    vel.add(acc);
    acc.mult(0);
    particles.add(new Particle(origin, random(255), random(10, 20), 0.5));
  }

  void applyForce(PVector f) {
    for (Particle p : particles) {
      p.applyForce(f);
    }
  }


  void run() {
    lifespan -= 2;
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

