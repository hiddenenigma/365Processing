class Particle extends VerletParticle2D {

  float w;

  Particle(Vec2D loc, float w_) {
    super(loc);
    w = w_;
    setWeight(w);
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, w*4, -0.2)); 
  }

  void display() {
    noStroke();
    fill(255);
    ellipse(x, y, w*2, w*2);
  }
}

