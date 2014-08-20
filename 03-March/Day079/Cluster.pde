// Toxiclibs Library Example
// Draggable Particles


class Cluster {
  ArrayList <ParticleString2D> pstrings;
  float s;
  float f;
  Particle p;

  Cluster(Vec2D pos, float s_, float f_) {
    s = s_;
    f = f_;
    pstrings = new ArrayList<ParticleString2D>();

    for (int i = 0; i < 100; i ++) {
      pstrings.add(new ParticleString2D(physics, new Vec2D(pos), Vec2D.fromTheta(0.01*i*TWO_PI).scaleSelf(8), 55, 10, 1));
    }

    p = new Particle();
  }

  void display() {
    for (Iterator i=physics.springs.iterator (); i.hasNext(); ) {
      VerletSpring2D s=(VerletSpring2D)i.next();
      strokeWeight(1);
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
    p.display();
  }

  void pressed() {
    p.pressed();
  }

  void released() {
    p.released();
  }
}
