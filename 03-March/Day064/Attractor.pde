// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Attractor extends VerletParticle2D {

  float r;

  Attractor (Vec2D loc, float r_) {
    super (loc);
    r = r_;
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, width, 0.008));
  }

  void display () {
    noStroke();
    fill(0,0);
    ellipse (width/2, height/2, r, r);
  }
}
