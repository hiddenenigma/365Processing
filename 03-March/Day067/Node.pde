// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Node extends VerletParticle2D {

  float mass;
  
  Node(Vec2D pos) {
    super(pos);
    mass = 5;
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, 100, .2));
  }
  

  // All we're doing really is adding a display() function to a VerletParticle
  void display() {
    noStroke();
    fill(0,0);
    ellipse(x,y, mass, mass);
  }
}



