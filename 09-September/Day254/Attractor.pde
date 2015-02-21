class Attractor extends VerletParticle2D {
  
  Attractor(Vec2D loc) {
    super(loc);
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, 50, -0.005));
  }
  
  void display() {
    stroke(0);
    strokeWeight(20);
    point(x,y);
  }
}
