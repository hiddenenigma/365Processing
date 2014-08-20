// Toxiclibs Library Example
// Draggable Particles

class Cluster {
  ArrayList <ParticleString2D> pstrings;

  Cluster(Vec2D pos){

    pstrings = new ArrayList<ParticleString2D>();
    for (int i = 0; i < 60; i ++) {
      pstrings.add(new ParticleString2D(physics, new Vec2D(pos), Vec2D.fromTheta(0.02*i*TWO_PI).scaleSelf(10), (int)random(5,25), 2, 0.5));
    }
  }
  
  void display() {
    for(Iterator i=physics.springs.iterator(); i.hasNext();) {
      VerletSpring2D s=(VerletSpring2D)i.next();
      strokeWeight(0.1);
      line(s.a.x,s.a.y,s.b.x,s.b.y);
    }
    for(Iterator i=physics.particles.iterator(); i.hasNext();) {
      VerletParticle2D p=(VerletParticle2D)i.next();
    ellipse(p.x,p.y,2,2);
    p.x += random(-1,1);
    p.y += random(-1,1);
   }
  }
}
