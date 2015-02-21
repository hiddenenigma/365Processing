class Chain {
  
  ArrayList<Particle> particles;
  PVector loc;
  float totalLength, radius, strength;
  int numParticles;

  Chain(float l, int n, float r, float s, float x, float y, float z) {

    particles = new ArrayList<Particle>();

    totalLength = l;
    numParticles = n;
    radius = r;
    strength = s;
    loc = new PVector(x,y,z);

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
    tail.lock();
  }

  void display() {
    pushMatrix();
    translate(loc.x,loc.y, loc.z);
    beginShape();
    for (Particle p : particles) {
      noFill();
      strokeWeight(3);
      stroke(255,50);
      vertex(p.x, p.y, p.z);
    }
    endShape();  
    popMatrix();
  }
}

