class Particle extends VerletParticle {
  
  float radius;
  
  Particle(Vec3D loc, float radius_) {
    super(loc);
    radius = radius_;
    physics.addBehavior(new AttractionBehavior(this, 50, -0.08));
  }
  
  void update() {
    x += random(-1,1);
    y += random(-1,1);
  }
  
  void display() {
    strokeWeight(radius);
    stroke(255);
    point(x,y,z);
  }
}
