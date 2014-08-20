// Toxiclibs Library Example
// Draggable Particles

class Cluster {
  ArrayList <ParticleString2D> pstrings;

  Cluster(Vec2D pos){
    pstrings = new ArrayList<ParticleString2D>();
    for (int i = 0; i < 10; i ++) {
      pstrings.add(new ParticleString2D(physics, new Vec2D(pos), Vec2D.fromTheta(i*0.1*TWO_PI).scaleSelf(10), 50, 1, 1));
    }
  }
  
  void display() {
    
    // draw all springs
    for(Iterator i=physics.springs.iterator(); i.hasNext();) {
      VerletSpring2D s=(VerletSpring2D)i.next();
      strokeWeight(0.5);
      line(s.a.x,s.a.y,s.b.x,s.b.y);
    }
    
    // draw all particles
    for(Iterator i=physics.particles.iterator(); i.hasNext();) {
      VerletParticle2D p=(VerletParticle2D)i.next();
      
    fill(0);
    ellipse(p.x,p.y,random(2),random(2));
   }
  }
}
