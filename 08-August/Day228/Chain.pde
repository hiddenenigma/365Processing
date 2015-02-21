class Chain {

  float totalLength;
  int numPoints;
  float strength;
  float radius;

  ArrayList<Particle> particles;
  float x, y;

  Chain(float x_, float y_, float l, int n, float r, float s) {
    particles = new ArrayList<Particle>();
    totalLength = l;
    numPoints = n;
    radius = r;
    strength = s;
    x = x_;
    y = y_;
    float len = totalLength / numPoints;

    for (int i = 0; i < numPoints; i++) {
      Particle particle = new Particle(new Vec3D(x, i * len, y));
      physics.addParticle(particle);
      particles.add(particle);
      if (i != 0) {   
        Particle previous = particles.get(i-1);
        VerletSpring spring = new VerletSpring(particle, previous, len, strength);
        physics.addSpring(spring);
      }
    }    
  }

  void display() {
    Particle head = particles.get(0);
    head.lock();    
    beginShape(POINTS);
    noFill();
    stroke(0,10);
    strokeWeight(radius);
    for (Particle p : particles) {
      vertex(p.x, p.y, p.z);
    }    
    endShape();
    beginShape();
    stroke(0,40);
    strokeWeight(1);
    for (Particle p : particles) {
      vertex(p.x, p.y, p.z);
    }
    endShape();
  }
}

