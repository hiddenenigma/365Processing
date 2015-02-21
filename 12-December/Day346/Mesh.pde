class Mesh {
  ArrayList<Particle> particles;
  ArrayList<VerletSpring2D> springs;

  int w;
  int h;
  float len = 2;
  float strength;
  int numMesh = 1;

  Mesh(int w_, int h_, float strength_) {
    particles = new ArrayList<Particle>();
    springs = new ArrayList<VerletSpring2D>();
    w=w_;
    h=h_;
    strength = strength_;
    addMesh();
  }

  void display() {
    for (VerletSpring2D s : springs) {
      line(s.a.x, s.a.y, s.b.x, s.b.y);
    }
  }

  void addMesh() {
    for (int y=0; y< h; y++) {
      for (int x=0; x < w; x++) {
        Particle p = new Particle(new Vec2D(x*len-w*len/2+random(-100,width+100), y*len+random(-100,height+100)), random(4));
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
    Particle topleft= particles.get(0);
    topleft.lock();
  }
}

