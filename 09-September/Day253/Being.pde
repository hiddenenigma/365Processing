class Being {

  Vec3D loc;
  float angle, radius;
  int count = 0;
  ArrayList<Particle> particles;
  float x, y;
  float z = 0;

  Being(float radius_, float x_, float y_) {
    angle = 0;
    radius = radius_;
    particles = new ArrayList<Particle>();
    x = x_;
    y = y_;
  }

  void run() {
    display();
  }

  void display() {
    drawParticles();
    drawSpring();
  }


  void drawParticles() {
    for (int i = 0; i < physics.particles.size (); i++) {
      Particle p = (Particle) physics.particles.get(i);
      p.display();
    }
  }

  void drawSpring() {
    for (int i = 0; i < physics.springs.size (); i++) {
      VerletSpring sp = (VerletSpring) physics.springs.get(i);
      stroke(255, 10);
      strokeWeight(1);
      line(sp.a.x, sp.a.y, sp.a.z, sp.b.x, sp.b.y, sp.b.z);
    }
  }
}

