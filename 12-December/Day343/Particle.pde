class Particle extends VerletParticle2D {
  float r;
  
  Particle(Vec2D loc) {
    super(loc);
    r = 4; 
  }

  void display() {
    fill(0);
    stroke(0);
    ellipse(x, y, r*2, r*2);
  }
}

