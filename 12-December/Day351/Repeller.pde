class Repeller extends VerletParticle2D {

  Repeller(Vec2D loc) {
    super(loc);
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, width, -4));
  } 
  
  void display() {
    fill(255,255,10);
    ellipse(x,y,10,10);
  }
}

