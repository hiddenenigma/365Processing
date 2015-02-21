class Particle extends VerletParticle {
  
  float radius;
  
  Particle(Vec3D loc, float radius_) {
    super(loc);
    radius = radius_;
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, 4, -0.01));
  }

  void display() {
    strokeWeight(radius);
    stroke(255,50);
    point(x,y,z);
  }
}
