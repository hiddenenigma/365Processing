// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin, vel, acc;
  float lifespan = 500;
  float ls, s, sw;
  
  ParticleSystem(PVector loc, float ls_, float s_, float sw_) {
    origin = loc.get();
    vel = new PVector(random(-0.1, 0.1), random(-0.1, 0.1));
    acc = new PVector(random(-0.01, 0.01), random(-0.01, 0.01));

    ls = ls_;
    s = s_;
    sw = sw_;
    particles = new ArrayList<Particle>();
  }
  
  void addParticle() {
    particles.add(new Particle(origin,ls,s,sw));
  }
  
  void run() {
    origin.add(vel);
    vel.add(acc);
//    acc.mult(0);
    lifespan--;
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext()) {
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
