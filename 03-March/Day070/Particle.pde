// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Particle extends VerletParticle2D {
  float diameter;
  
  Particle(Vec2D pos) {
    super(pos);
    diameter = 2;
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, 11, 1));
  }
  
  void display() {
    fill(0);
    ellipse(x, y, diameter, diameter);
  }
}
