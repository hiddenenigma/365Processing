class Chain {

  float totalLength;
  int numPoints;
  float strength;
  float radius;
  float theta;
  ArrayList<Particle> particles;
  Vec3D loc;

  Chain(Vec3D loc_, float l, int n, float r, float s, float theta_) {
    particles = new ArrayList<Particle>();
    totalLength = l;
    numPoints = n;
    radius = r;
    strength = s;
    loc = loc_;
    theta = theta_;
    float len = totalLength / numPoints;

    for (int i = 0; i < numPoints; i++) {
      Particle particle = new Particle(new Vec3D( (i * len) + loc.x, len, loc.z));
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
    Particle tail = particles.get(numPoints-1);
    tail.lock();
    pushMatrix();
    rotateX(radians(theta));
    rotateY(radians(-theta));
    beginShape(POINTS);
    noFill();
    stroke(0, 20);
    strokeWeight(radius);
    for (Particle p : particles) {
      vertex(p.x, p.y, p.z);
    }    
    endShape();
    beginShape();
    stroke(0, 50);
    strokeWeight(1);
    for (Particle p : particles) {
      vertex(p.x, p.y, p.z);
    }
    endShape();    
    popMatrix();
  }
}

