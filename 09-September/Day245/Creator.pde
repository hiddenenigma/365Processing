class Creator {

  Vec3D loc = new Vec3D();
  Vec3D cen;
  float angle, radius;
  float z = 0;

  int count = 0;
  float speed = 0.01;

  Creator(Vec3D cen_) {
    cen = cen_;
    angle = 0;
    radius = 250;
  }

  void run() {
    calcLoc();
    moveUpdate();
    dropParticles();
    dropSprings();
  }

  void dropParticles() {
    Particle p = new Particle(new Vec3D(loc.x, loc.y, loc.z));
    physics.addParticle(p);
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
      speed += random(0.001,0.005);
    }
  }

  void display() {
    strokeWeight(5);
    stroke(0, 255, 0);
    point(loc.x, loc.y, loc.z);
  }
}

