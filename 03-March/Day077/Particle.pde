class Particle extends VerletParticle2D {
  float diameter;
  float radius;

  Particle(Vec2D pos, float diameter_) {
    super(pos);
    diameter = diameter_;
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, 275, -2));
  }

  void display() {
    noFill();
    noStroke();
    ellipse(x, y, diameter,diameter);
  }
}
