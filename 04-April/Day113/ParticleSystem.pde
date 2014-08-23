// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  PVector vel;
  PVector acc;
  float v = 1;
  float a = 0.01;


  ParticleSystem(PVector loc) {
    particles = new ArrayList<Particle>();
    origin = loc.get();
    vel = new PVector(random(-v,v), random(-v,v));
    acc = new PVector(random(-a,a),random(-a,a));
  }
  
  void addParticle() {
    particles.add(new Particle(origin,random(10), random(255), random(3,20), 1));
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


    checkEdges();
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
  
    void checkEdges() {

    // When it reaches one edge, set location to the other.
    if (origin.x > width) {
//      origin = new PVector(width/2,height/2);
      vel = new PVector(random(-v,v),random(-v,v));
      acc = new PVector(random(-a,a),random(-a,a));
    } else if (origin.x < 0) {
//      origin = new PVector(width/2, height/2);
      vel = new PVector(random(-v,v),random(-v,v));
      acc = new PVector(random(-a,a),random(-a,a));
    }

    if (origin.y > height) {
//      origin = new PVector(width/2, height/2);
      vel = new PVector(random(-v,v),random(-v,v));
      acc = new PVector(random(-a,a),random(-a,a));
    } else if (origin.y < 0) {
//      origin = new PVector(width/2, height/2);
      vel = new PVector(random(-v,v),random(-v,v));
      acc = new PVector(random(-a,a),random(-a,a));
    }
//
  }
 

}
