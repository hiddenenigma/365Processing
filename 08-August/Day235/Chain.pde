class Chain {
  ArrayList<Particle> particles;
  float  totalLength, radius, strength;
  int numParticles;
  PVector location;

  Chain(float l, int n, float r, float s, float x, float y) {

    particles = new ArrayList<Particle>();
    totalLength = l;
    numParticles = n;
    radius = r;
    strength = s;
    location = new PVector(x,y);
    Particle head, tail;
    float len = totalLength / numParticles;

    for (int i = 0; i < numParticles; i++) {
      Particle particle = new Particle(new Vec2D(i*len+location.x,location.y), radius);
      physics.addParticle(particle);
      particles.add(particle);
      if ( i != 0 ) {
        Particle previous = particles.get(i-1);
        VerletSpring2D spring = new VerletSpring2D(particle, previous, len, strength);
        physics.addSpring(spring);
      }
    }

    head = particles.get(0);
    head.lock();
    tail = particles.get(numParticles-1);
    tail.lock();
  }

  void display() {
    for (int i = 0; i < physics.springs.size (); i++) {
      VerletSpring2D vs = (VerletSpring2D) physics.springs.get(i);
      stroke(0);
      strokeWeight(1);
      line(vs.a.x, vs.a.y, vs.b.x, vs.b.y);
    }
  }
  
  void borders() {
    if (location.x < -radius) location.x = width+radius;
    if (location.y < -radius) location.y = height+radius;
    if (location.x > width+radius) location.x = -radius;
    if (location.y > height+radius) location.y = -radius;
  }
}

