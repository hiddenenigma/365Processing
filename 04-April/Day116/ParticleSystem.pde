// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  PVector vel;
  PVector acc;
  
  ParticleSystem(PVector loc) {
    particles = new ArrayList<Particle>();
    origin = loc.get();
    vel = new PVector(random(-1,1),random(-1,1));
    acc = new PVector(random(-0.01,0.01), random(-0.01,0.01));
  }
  
  void addParticle() {
    particles.add(new Particle(origin, random(255), random(0.1,1), random(0.5,2)));
  }
  
  void applyForce(PVector f) {
    for (Particle p: particles) {
      p.applyForce(f);
    }
  }
  
  void applyRepeller(Repeller r) {
    for (Particle p: particles) {
      PVector force = r.repel(p);
      p.applyForce(force);
    }
  }
  
  void run() {
    origin.add(vel);
    vel.add(acc);
    Iterator<Particle> it = particles.iterator();
    //[full] Using an Iterator object instead of counting with int i
    while (it.hasNext ()) {
      Particle p = it.next();
      p.run();
      if (p.isDead()) {
        it.remove();
      }
    }
  }
}  
