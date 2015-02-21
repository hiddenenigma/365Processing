// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Attractor extends VerletParticle {

  Attractor (Vec3D loc) {
    super (loc);
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, width, -0.008));
  }

  void display () {
    noStroke();
    fill(0,0);
    translate(x,y,z);
    ellipse (0, 0, 2, 2);
  }
}
