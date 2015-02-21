class Particle extends VerletParticle {
  
  float r;

  Particle(Vec3D loc, float r_) {
    super(loc);
    r = r_;
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, r*4, -0.03));    
  }
  
  void display() {
    stroke(0,50);
    strokeWeight(r);
    point(x, y, z);
  }
}

