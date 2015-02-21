class Attractor extends VerletParticle2D {
  
  Attractor(Vec2D loc) {
    super(loc);
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, width, 0.5));
  } 
  
  void display() {
    fill(255,0,255);
    ellipse(x,y,10,10);
  }
}
