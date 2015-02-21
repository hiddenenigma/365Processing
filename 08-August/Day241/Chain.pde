class Chain {
  ArrayList<Particle> particles;

  float  totalLength, radius, strength;
  int numParticles;
  PVector loc;

  Chain(float l, int n, float r, float s, float x, float y) {
    loc = new PVector(x,y);
    particles = new ArrayList<Particle>();

    totalLength = l;
    numParticles = n;
    radius = r;
    strength = s;

    float len = totalLength / numParticles;

    for (int i = 0; i < numParticles; i++) {

      Particle particle = new Particle(new Vec2D(i*len,loc.y));
      physics.addParticle(particle);
      particles.add(particle);

      if ( i != 0 ) {
        Particle previous = particles.get(i-1);
        VerletSpring2D spring = new VerletSpring2D(particle, previous, len, strength);
        physics.addSpring(spring);
      }
    }
    for (int i = 0; i < numParticles; i += 20) {
      Particle randParticle = particles.get((int)random(numParticles));      
      randParticle.lock();
    }
  }

  void display() {
    beginShape();
    for (Particle p : particles) {
      if (mousePressed) {
        p.unlock();
      }
      fill(255);
      strokeWeight(radius);
      stroke(0);
      vertex(p.x, p.y);
    }
    endShape();  
  }
}

