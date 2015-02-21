class Attractor extends VerletParticle {
  
  Attractor(Vec3D loc) {
    super(loc);
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, width, 0.2));
  }
  
  void display() {
    strokeWeight(10);
    stroke(0);
    point(x,y,z);
  }
}
