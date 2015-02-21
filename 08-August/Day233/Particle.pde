class Particle extends VerletParticle {

  Particle(Vec3D loc) {
    super(loc);
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this,28,-1));
  }
  
  void display() {
    stroke(255);
    strokeWeight(5);
    point(x,y,z);
  }
}
