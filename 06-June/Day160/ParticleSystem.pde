// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  
  ParticleSystem(PVector loc) {
    origin = loc.get();
    particles = new ArrayList<Particle>();
  }
  
  void addParticle() {
    particles.add(new Particle(origin, random(200,255), random(1,20)));
  }
  
  void applyForce(PVector f) {
    for (Particle p: particles) {
      p.applyForce(f);
    }
  }
  
  void applyRepeller(ArrayList a) {
    for (int i = 0; i < particles.size(); i++) {
      Particle p = (Particle) particles.get(i);
      for (int j = 0; j < repellers.size(); j++) {
        Repeller r = (Repeller) repellers.get(j);
        PVector force = r.repel(p);
        p.applyForce(force);
      }
    }
  }
  
  void run() {
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext()) {
      Particle p = it.next();
      p.run();
      if (p.isDead()) {
        it.remove();
      }
    }
  }
}
