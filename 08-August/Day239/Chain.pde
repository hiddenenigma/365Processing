class Chain {
  
  ArrayList<Particle> particles;
  float totalLength, radius, strength;
  int numParticles;

  Chain(float l, int n, float r, float s) {

    particles = new ArrayList<Particle>();
    totalLength = l;
    numParticles = n;
    radius = r;
    strength = s;
    float len = totalLength / numParticles;

    for (int i = 0; i < numParticles; i++) {
      float angle = i * TWO_PI/numParticles;

      float x = sin(angle) * len;
      float y = cos(angle) * len;
      Particle particle = new Particle(new Vec3D(x, i*len + random(275,300), y), radius);
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

  }

  void display() {
    for (Particle p : particles) {
      for (Particle other : particles) {
        float d = p.distanceTo(other);
        if ((d > 0) && (d < 75)) {
          stroke(0,75-d);
          line(p.x, p.y, p.z, other.x, other.y, other.z);
        }
      }
    }
  }
}

