// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Particle extends VerletParticle2D {
  float diameter; 

  Particle(Vec2D pos, float diameter_) {
    super(pos);
    diameter= diameter_;

    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, 1, 1));
  }
  
  void display() {
    noStroke();
    fill(255);
    ellipse(x, y, diameter, diameter);
  }
}
