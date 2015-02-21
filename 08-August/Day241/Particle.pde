class Particle extends VerletParticle2D {
  
  
  Particle(Vec2D loc) {
    super(loc);
    physics.addParticle(this);
  }
  
  void display() {
    noStroke();
    fill(0);
    ellipse(x,y,5*2,5*2);
  }
}
