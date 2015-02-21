class Particle extends VerletParticle{
    
  Particle(Vec3D loc) {
    super(loc);
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, 2, -1));    
  }
  
  void display() {
    stroke(0);
    point(x,y,z);
  }
}
