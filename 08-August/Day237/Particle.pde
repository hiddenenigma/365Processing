class Particle extends VerletParticle {
  
  float r;

  Particle(Vec3D loc, float r_) {
    super(loc);
    r = r_;
    physics.addParticle(this);
  }

  void display() {
    stroke(0,50);
    strokeWeight(r);
    point(x, y, z);
  }
}

