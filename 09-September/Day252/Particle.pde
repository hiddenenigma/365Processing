class Particle extends VerletParticle {
  
  float radius;
  
  Particle(Vec3D loc, float radius_) {
    super(loc);
    radius = radius_;
  }
  
  void update() {
    x += random(-0.5,0.5);
    y += random(-0.5,0.5);
  }
  
  void display() {
    strokeWeight(radius);
    stroke(255,50);
    point(x,y,z);
  }
}
