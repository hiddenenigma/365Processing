class Particle extends VerletParticle {
  
  Particle(Vec3D loc) {
    super(loc);
  }
  
  void display() {
    strokeWeight(5);
    point(x,y,z);
  }
}
