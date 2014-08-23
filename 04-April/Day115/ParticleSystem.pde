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
    vel = new PVector(random(-1,1), random(-1,1));
    acc = new PVector(0.0005,random(-0.005,0.005));    
  }
  
  void addParticle() {
    float r = random(1);
    if (r < 0.2) {
      particles.add(new Particle(origin));
    } else {
      particles.add(new Confetti(origin, random(2,4)));
    }
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
