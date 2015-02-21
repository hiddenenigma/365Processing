class Particle extends VerletParticle{
  
  Particle(Vec3D loc) {
    super(loc);
  }
  
  void display() {
    stroke(0);
    point(x,y,z);
  }
}
