class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  float lifespan = 255;
  
  ParticleSystem(PVector loc) {
    origin = loc.get();
    particles = new ArrayList<Particle>();
  }
  
  void addParticle() {
    particles.add(new Particle(origin, 0, random(5,10), 0.5));
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
    lifespan -= 2;
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
