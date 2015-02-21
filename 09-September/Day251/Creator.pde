class Creator {

  Vec3D loc;
  float angle, radius;
  float z = 0;

  int count = 0;
  float speed;
  ArrayList<Particle> particles;

  Creator(float radius_, float speed_) {
    angle = 0;
    radius = radius_;
    speed = speed_;
    particles = new ArrayList<Particle>();
  }

  void run() {
    calcLoc();
    moveUpdate();
    dropParticles();
    dropSprings();
  }

  void dropParticles() {
    Particle p = new Particle(new Vec3D(loc.x, loc.y, loc.z), random(5));

    if (z==0) {
      p.lock();
    }

    physics.addParticle(p);
    particles.add(p);
    count++;
  }  

  void dropSprings() {
    int dif = int(TWO_PI/speed);   
    if (z > 0) {  
      if (count > 1) {
        Particle p0 = (Particle) physics.particles.get(count-1);
        Particle p1 = (Particle) physics.particles.get(count-2);    
        Particle p2 = (Particle) physics.particles.get(count-1-dif);
        
        VerletSpring vs = new VerletSpring(p0, p1, 1, 0.1);
        physics.addSpring(vs);

        VerletSpring vs2 = new VerletSpring(p0, p2, 1, 0.1);
        physics.addSpring(vs2);
      }
    }
  }

  void calcLoc() {
    loc = new Vec3D(cos(angle)*radius, sin(angle)*radius, 0);
  }

  void moveUpdate() {
    angle+= speed;
    if (angle >= TWO_PI) {
      angle = 0;
      z++;
    }
  }
}

