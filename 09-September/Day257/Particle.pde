class Particle extends VerletParticle2D {

  float r;

  Particle(Vec2D loc) {
    super(loc);
    r = 5;
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, r*2, -0.5));
  }
}

