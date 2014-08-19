// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// class Particle extends the class "VerletParticle2D"
class Particle extends VerletParticle2D {

  float r;
  
  Particle (Vec2D loc, float r_) {
    super(loc);
    r = r_;
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, r*2, -1));

  }

  void display () {
    noStroke();
    fill (0,50);
    ellipse (x, y, r*2, r*2);
  }
}
