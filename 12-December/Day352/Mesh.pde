class Mesh {
  ArrayList<Particle> particles;
  ArrayList<VerletSpring2D> springs;

  int w;
  int h;
  float len;
  float strength;
  int numMesh = 1;

  Mesh(int w_, int h_, float len_, float strength_) {
    particles = new ArrayList<Particle>();
    springs = new ArrayList<VerletSpring2D>();
    w=w_;
    h=h_;
    len=len_;
    strength = strength_;
    addMesh();
  }

  void display() {
    for (Particle p : particles) {
      p.display();
    }
    for (VerletSpring2D s : springs) {
      line(s.a.x, s.a.y, s.b.x, s.b.y);
    }
  }

  void addMesh() {
    for (int y=0; y< h; y++) {
      for (int x=0; x < w; x++) {
        Particle p = new Particle(new Vec2D(x*len-w*len/2+width/2, y*len+random(-100, height+100)), random(5));
        physics.addParticle(p);
        particles.add(p);

        if (x > 0) {
          Particle previous = particles.get(particles.size()-2);
          VerletSpring2D c = new VerletSpring2D(p, previous, len, strength);
          physics.addSpring(c);
          springs.add(c);
        }

        if (y > 0) {
          Particle above = particles.get(particles.size()-w-1);
          VerletSpring2D c=new VerletSpring2D(p, above, len, strength);
          physics.addSpring(c);
          springs.add(c);
        }
      }
    }
    for (int i = 0; i < particles.size (); i+=50) {
      Particle plock = particles.get((int)random(i));
      plock.lock();
    }
  }
}

