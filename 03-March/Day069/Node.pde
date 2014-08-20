// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Node extends VerletParticle2D {
  float diameter;
  float radius;
  float size;

  Node(Vec2D pos, float diameter_, float size_) {
    super(pos);
    diameter = diameter_;
    size = size_;
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, size, -0.5));
  }

  void display() {
    fill(255,70);
    noStroke();
    x+= random(-1, 1);
    y+= random(-1,1);
    ellipse(x, y,diameter,diameter);
  }
}
