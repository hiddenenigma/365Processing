class Chain {
  float x;
  float sw;
  ArrayList<Particle> particles;  
  float len = 10;
  float strength = 0.01;
  int numParticles = 35;
  VerletSpring2D spring;

  Chain(float x_, float sw_) {
    x = x_;
    sw = sw_;
    particles = new ArrayList<Particle>();
    for (int i = 0; i < numParticles; i++) {
      Particle particle = new Particle(new Vec2D(i*len, 0));
      physics.addParticle(particle);
      particles.add(particle);
      if (i != 0) {
        Particle previous = particles.get(i-1);
        VerletSpring2D spring = new VerletSpring2D(particle, previous, len, strength);
        physics.addSpring(spring);
      }
    }
     Particle head = particles.get(0);
     head.lock();
  }

  void display() {
    pushMatrix();
    translate(x, 0);
    beginShape();
    noFill();
    strokeWeight(sw);
    stroke(0,75);
    for (Particle p : particles) {
      vertex(p.x, p.y);
    }
    endShape();
    popMatrix();
  }
}

