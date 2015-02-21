class Particle extends VerletParticle2D {
  
  Vec3D vel;
  float w;

  Particle(Vec2D loc, float w_) {
    super(loc);
    vel = vel;
    w = w_;
    // particles do not touch one another
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, w*2, -0.1));
  }

  void display() {
    stroke(0,50);
    strokeWeight(w);
    point(x, y);
  }
}

