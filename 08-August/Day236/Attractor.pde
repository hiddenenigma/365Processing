class Attractor extends VerletParticle2D {
    
  Attractor(Vec2D loc, float w) {
    super(loc);
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this,  w*4, 0.1));
    setWeight(w);
  }
  
  void display() {
    fill(0);
    noStroke();
    ellipse(x, y, weight, weight);
  }
}
