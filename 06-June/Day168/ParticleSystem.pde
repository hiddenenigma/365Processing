// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin, vel, acc;
  float lifespan = 255;
  
  ParticleSystem(PVector loc) {
    origin = loc.get();
    vel = new PVector(random(-0.5,0.5), random(-0.5,0.5));
    acc = new PVector(random(-0.6,0.6), random(-0.6,0.6));
    particles = new ArrayList<Particle>();
  }
  
  void addParticle() {
    particles.add(new Particle(origin, random(200,255), random(10,20), 1));
  }
  
  void applyForce(PVector f) {
    for (Particle p: particles) {
      p.applyForce(f);
    }
  }
  
  void run() {
    lifespan -= 6;
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
