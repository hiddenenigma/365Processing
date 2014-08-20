// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Node extends VerletParticle2D {

  float mass;
  
  Node(Vec2D pos) {
    super(pos);
    mass = 8;
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, -.2, 2));
  }

  // All we're doing really is adding a display() function to a VerletParticle
  void display() {
    noStroke();
    fill(0);
    ellipse(x,y, mass, mass);
  }
}



