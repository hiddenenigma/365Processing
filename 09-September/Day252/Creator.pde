class Creator {

  Vec3D loc;
  float angle, radius;
  float z = 0;

  int count = 0;
  float speed;
  ArrayList<Particle> particles;
  float x, y;
 

  Creator(float radius_, float speed_, float x_, float y_) {
    angle = 0;
    radius = radius_;
    speed = speed_;
    particles = new ArrayList<Particle>();
    x = x_;
    y = y_;
  }

  void run() {
    calcLoc();
    moveUpdate();
    dropParticles();
    dropSprings();
    display();
  }
  
  void dropParticles() {
    Particle p = new Particle(new Vec3D(loc.x+x, loc.y+y, loc.z), random(5));
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
        Particle p0 = particles.get(count-1);
        Particle p1 = particles.get(count-2);    
        Particle p2 = particles.get(count-1-dif);
        
        VerletSpring vs = new VerletSpring(p0, p1, 1, 0.01);
        physics.addSpring(vs);

        VerletSpring vs2 = new VerletSpring(p0, p2, 1, 0.01);
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

  void display() {
    drawSpring();   
  }
}

void drawSpring() {
  for (int i = 0; i < physics.springs.size(); i++) {
    VerletSpring sp = (VerletSpring) physics.springs.get(i);
    stroke(255,10);
    strokeWeight(1);
    line(sp.a.x, sp.a.y, sp.a.z, sp.b.x, sp.b.y, sp.b.z);
  }
}

