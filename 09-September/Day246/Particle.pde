class Particle extends VerletParticle {
  
  Particle(Vec3D loc) {
    super(loc);
  }
  
  void display() {
    strokeWeight(4);
    stroke(255);
    point(x,y,z);
  }
}
