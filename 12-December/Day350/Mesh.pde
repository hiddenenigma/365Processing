class Mesh {
  ArrayList<Particle> particles;
  ArrayList<VerletSpring2D> springs;

  int w;
  int h;
  float len = 2;
  float strength;
  int numMesh = 1;
  Vec2D loc;
  
  Mesh(int w_, int h_, float strength_, Vec2D loc_) {
    particles = new ArrayList<Particle>();
    springs = new ArrayList<VerletSpring2D>();
    w=w_;
    h=h_;
    strength = strength_;
    loc = loc_;
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
        Particle p = new Particle(new Vec2D(x*len-w*len/2+loc.x, y*len+loc.y), 5);
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
    Particle topleft = particles.get(0);
    topleft.lock();
    
    Particle topright = particles.get(w-1);
    topright.lock();
    
    Particle bottomleft = particles.get(particles.size()-h);
    bottomleft.lock();
    
    Particle bottomright = particles.get(particles.size()-1);
    bottomright.lock();
  }
}

