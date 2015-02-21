class Chain {

  ArrayList<Particle> particles;
  float totalLength, radius, strength;
  int numPoints;

  Chain(float l, int n, float r, float s) {
    particles = new ArrayList<Particle>();
    totalLength = l;
    numPoints = n;
    radius = r;
    strength = s;

    float len = totalLength / numPoints;
    for (int i = 0; i < numPoints; i++) {
      Particle particle = new Particle(new Vec3D(0, i*len, 0));
      physics.addParticle(particle);
      particles.add(particle);
      if (i != 0) {       
        Particle previous = particles.get(i-1);
        VerletSpring sp = new VerletSpring(particle, previous, len, strength);
        physics.addSpring(sp);
      }
    }
  }
  
  void display() {
    Particle head = particles.get(0);

    Particle tail = particles.get(numPoints-1);    
    beginShape(POINTS);
    stroke(0,50);
    strokeWeight(radius);
    for (Particle p : particles) {
      sc.apply(p);
      vertex(p.x, p.y, p.z);
    }    
    endShape();  
    
    for (int i = 0; i < physics.springs.size (); i++ ) {
      VerletSpring sp = (VerletSpring) physics.springs.get(i);
      stroke(0, 50);
      strokeWeight(1);
      line(sp.a.x, sp.a.y, sp.a.z, sp.b.x, sp.b.y, sp.b.z);
    }
  }
}

