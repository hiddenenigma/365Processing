class Attractor extends VerletParticle {
  
  Attractor(Vec3D loc) {
    super(loc);
    
    // particles will move towards this attractor
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, width, 0.35));
  }
  
  void display() {
    stroke(0);
    strokeWeight(20);
    point(x,y,z);
  }
}
