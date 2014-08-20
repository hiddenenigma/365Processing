// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Node extends VerletParticle2D {
  float diameter;
  float radius;

  Node(Vec2D pos, float diameter_) {
    super(pos);
    diameter = diameter_;
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, width, 0.1));
  }

  void display() {
    fill(255);
    noStroke();
    ellipse(x, y,diameter,diameter);
  }
}
