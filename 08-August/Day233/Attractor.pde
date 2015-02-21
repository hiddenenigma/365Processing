class Attractor extends VerletParticle {
  
  Attractor(Vec3D loc) {
    super(loc);
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, width, 0.1));
  }
  
  void display() {
    point(x,y,z);
  }
}
