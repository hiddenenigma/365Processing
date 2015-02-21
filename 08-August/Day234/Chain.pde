class Chain {
  ArrayList<Particle> particles;

  float  totalLength, numParticles, radius, strength;

  Chain(float l, float n, float r, float s) {

    particles = new ArrayList<Particle>();

    totalLength = l;
    numParticles = n;
    radius = r;
    strength = s;

    Particle tail;

    float len = totalLength / numParticles;

    for (int i = 0; i < numParticles; i++) {
      Particle particle = new Particle(new Vec2D(0, (i*len)-1000), radius);

      physics.addParticle(particle);
      particles.add(particle);

      if ( i != 0 ) {
        Particle previous = particles.get(i-1);
        VerletSpring2D spring = new VerletSpring2D(particle, previous, len, strength);
        physics.addSpring(spring);
      }
    }
    Particle head = particles.get(0);
  }

  void display() {
    for (int i = 0; i < physics.springs.size (); i++) {
      VerletSpring2D vs = (VerletSpring2D) physics.springs.get(i);
      stroke(0);
      strokeWeight(2);
      line(vs.a.x, vs.a.y, vs.b.x, vs.b.y);
    }
  }
}

