// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Particle extends VerletParticle2D {
  
  float diameter;   

  Particle(Vec2D pos, float diameter_) {
    super(pos);
    diameter= diameter_;
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, 10, 2));
  }

  void run() {
    display();
  }

  void display() {
    noStroke();
    fill(0);
    ellipse(x, y, diameter, diameter);
  }
}
