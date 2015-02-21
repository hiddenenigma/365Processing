class Particle extends VerletParticle2D {

  float r;
  float delta;
  int STRING_RES;

  Particle(Vec2D loc, int STRING_RES_) {
    super(loc);
    physics.addParticle(this);
    STRING_RES = STRING_RES_;
    delta=(float)width/(STRING_RES-1);
    physics.addBehavior(new AttractionBehavior(this, 25,-5));
  }

  void display() {
    noStroke();
    fill(0);
    ellipse(x, y, r*2, r*2);
  }
}

