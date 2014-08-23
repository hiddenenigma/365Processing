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
    particles.add(new Particle(origin, random(20), random(3), random(2,10)));
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
  
  void checkEdges() {
    if (origin.x > width) {
      origin.x = width;
      vel.x *= -1;
    } else if (origin.x < 0) {
      vel.x *= -1;
      origin.x = 0;
    }

    if (origin.y > height) {
      vel.y *= -1;
      origin.y = height;
    } else if (origin.y < 0) {
      vel.y *= -1;
      origin.y = 0;
    }
  }
}
