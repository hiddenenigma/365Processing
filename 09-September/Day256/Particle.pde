class Particle extends VerletParticle2D {

  float r;

  Particle(Vec2D loc) {
    super(loc);
    r = 5;
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, r*4, -0.3));
  }
  
  void update() {
    x += random(-1,1);
    y += random(-1,1);
  }
}

