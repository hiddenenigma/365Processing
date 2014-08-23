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
    vel = new PVector(random(-0.1,0.1), random(-0.1,0.1));
    acc = new PVector(0,random(-0.001,0.001));
  }
  
  void addParticle() {
    particles.add(new Particle(origin, random(2), random(8), random(255)));
  }
 
  
  void run() {
//    origin.add(vel);
//    vel.add(acc);
//    acc.mult(0);
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
