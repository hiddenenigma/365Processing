class Creature {
  float x, y;
  int p;

  Creature(float x_, float y_, int p_) {
    x=x_;
    y=y_;
    p=p_;
    
    for (int i=0; i<1000; i++) {
      ParticleString2D s=new ParticleString2D(physics, new Vec2D(x,y), Vec2D.fromTheta(i*TWO_PI*0.001).scaleSelf(random(1, 10)), p, 1, 0.05);
    }
  }

  void display() {
    for (Iterator i=physics.springs.iterator (); i.hasNext(); ) {
      VerletSpring2D s=(VerletSpring2D)i.next();
      line(s.a.x, s.a.y, s.b.x, s.b.y);
    }
    for (Iterator i=physics.particles.iterator (); i.hasNext(); ) {
      VerletParticle2D g=(VerletParticle2D)i.next();
      g.x += random(-0.1,0.1);
      g.y += random(-0.1,0.1);
    }
  }
}

