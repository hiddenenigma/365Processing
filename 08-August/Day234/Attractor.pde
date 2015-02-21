class Attractor extends VerletParticle2D {
  
  Attractor(Vec2D loc) {
    super(loc);
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, width, 0.1));
  }
}
