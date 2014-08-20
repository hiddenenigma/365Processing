// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Node extends VerletParticle2D {
  float diameter;

  Node(Vec2D pos, float diameter_) {
    super(pos);
    diameter = diameter_;
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, 100, 0.5));
  }

  void display() {
    fill(0);
    stroke(0);
    ellipse(x, y,diameter,diameter);
  }
}
