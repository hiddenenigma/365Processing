class Chain {
  
  ArrayList<Particle> particles;
  PVector loc;
  float totalLength, radius, strength;
  int numParticles;

  Chain(float l, int n, float r, float s, float x, float y) {

    particles = new ArrayList<Particle>();
    totalLength = l;
    numParticles = n;
    radius = r;
    strength = s;
    loc = new PVector(x,y);
    float len = totalLength / numParticles;
    
    for (int i = 0; i < numParticles; i++) {
      Particle particle = new Particle(new Vec3D(0, i*len - 250, 0), radius);
      physics.addParticle(particle);
      particles.add(particle);

      if ( i != 0 ) {
        Particle previous = particles.get(i-1);
        VerletSpring spring = new VerletSpring(particle, previous, len, strength);
        physics.addSpring(spring);
      }
    }
    Particle head = particles.get(0);
    head.lock();  
  
    Particle tail = particles.get(numParticles-1);
    tail.set(head);
    tail.lock();
  }

  void display() {
  
    pushMatrix();
    translate(loc.x,loc.y);
    for (Particle p : particles) {
      for (Particle other : particles) {
        float d = p.distanceTo(other);
        if ((d > 0) && (d < 25)) {
          stroke(0, 50-d);
          strokeCap(ROUND);
          line(p.x, p.y, p.z, other.x, other.y, other.z);
        }
      }
    }
    popMatrix();
  }
}

