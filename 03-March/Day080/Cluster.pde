// Toxiclibs Library Example
// Draggable Particles

class Cluster {
  ArrayList <ParticleString2D> pstrings;
  ArrayList <Particle> particles;
  float s;
  float f;

  Cluster(float s_, float f_) {
    s = s_;
    f = f_;
    
    pstrings = new ArrayList<ParticleString2D>();
    for (int i = -50; i < height+50; i += 10) {
      pstrings.add(new ParticleString2D(physics, new Vec2D(-100, i), Vec2D.fromTheta(0).scaleSelf(10), 70, 10, 1));
    }
    
    particles = new ArrayList<Particle>();
    for (int i = 0; i < 3; i ++) {
      particles.add(new Particle(random(width), random(height)));
    }
  }

  void display() {
    
    for (Iterator i=physics.springs.iterator (); i.hasNext(); ) {
      VerletSpring2D s=(VerletSpring2D)i.next();
      strokeWeight(0.5);
      stroke(0);
      line(s.a.x, s.a.y, s.b.x, s.b.y);
    }
    
    for (Iterator i=physics.particles.iterator (); i.hasNext(); ) {
      VerletParticle2D g=(VerletParticle2D)i.next();
      fill(0);
      ellipse(g.x, g.y, 3, 3);
      g.x += random(-0.1, 0.1);
      g.y += random(-0.1, 0.1);
    }
  }

  void pressed() {
    for (Particle p : particles) {
      p.pressed();
    }
  }

  void released() {
    
    for (Particle p : particles) {
      p.released();
      
    }
  }
}
