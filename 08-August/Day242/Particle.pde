class Particle extends VerletParticle2D {
  
  float r;
  
  Particle(Vec2D loc, float r_) {
    super(loc);
    r = r_;
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, 12, -0.5, 0.001));
  }
  
  void display() {
    noStroke();
    fill(0);
    ellipse(x,y,r*2,r*2);
  }
}
