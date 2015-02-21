class Attractor extends VerletParticle2D {
    
  Attractor(Vec2D loc) {
    super(loc);
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, width, 0.03));
  }
  
  void display() {
    fill(255,0,0);
    noStroke();
    ellipse(x, y, 20, 20);
  }
}
