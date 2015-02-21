class Chain {

  float totalLength;
  int numPoints;
  float strength;
  float radius;
  ArrayList<Particle> particles;
  Vec3D loc;
  Vec3D oriLoc;
  Vec3D vel;
  int generations;
  String type;


  Chain(Vec3D loc_, Vec3D vel_, int generations_, String type_, float l, int n, float r, float s) {
    particles = new ArrayList<Particle>();
    totalLength = l;
    numPoints = n;
    radius = r;
    strength = s;

    loc = loc_;
    oriLoc = loc_.copy();
    vel = vel_;
    generations = generations_;
    type = type_;

    float len = totalLength / numPoints;

    for (int i = 0; i < numPoints; i++) {
      Particle particle = new Particle(new Vec3D(loc.x, loc.y + (i*len), loc.z + (i*len)));
      physics.addParticle(particle);
      particles.add(particle);
      if (i != 0) {   
        Particle previous = particles.get(i-1);
        VerletSpring spring = new VerletSpring(particle, previous, len, strength);
        physics.addSpring(spring);
      }
    }

    updateLoc();
    updateDir();
    spawn();
  }

  void spawn() {
    if (generations > 0) {

      if (type == "A") {

        Vec3D v = loc.copy();
        Vec3D initVel = vel.copy();
        Chain newChain = new Chain(v, initVel, generations-1, "B", random(-150, 150), (int)random(25,100), random(5), random(0.1, 0.5));  

        chains.add(newChain);


      }

      if (type == "B") {

        Vec3D v2 = loc.copy();
        Vec3D initVel2 = vel.copy();
        Chain newChain2 = new Chain(v2, initVel2, generations-1, "C", random(-150, 150), (int)random(25,100), random(5), random(0.1, 0.5));  

        chains.add(newChain2);

      }      

      if (type == "C") {

        Vec3D v3 = loc.copy();
        Vec3D initVel3 = vel.copy();
        Chain newChain3 = new Chain(v3, initVel3, generations-1, "A", random(-150, 150), (int)random(25,100), random(5), random(0.1, 0.5));  

        chains.add(newChain3);
      }
    }
  }

  void updateLoc() {
    loc.addSelf(vel);
  }

  void updateDir() {
    if (type == "A") {
      float angle1 = radians(a1);
      float angle2 = radians(0);
      float angle3 = radians(0);

      vel.rotateX(angle1);
      vel.rotateY(angle2);
      vel.rotateZ(angle3);

      vel.normalize();
      vel.scaleSelf(a);
    }

    if (type == "B") {
      float angle1 = radians(0);
      float angle2 = radians(a2);
      float angle3 = radians(0);

      vel.rotateX(angle1);
      vel.rotateY(angle2);
      vel.rotateZ(angle3);

      vel.normalize();
      vel.scaleSelf(a);
    }

    if (type == "C") {
      float angle1 = radians(0);
      float angle2 = radians(0);
      float angle3 = radians(a3);

      vel.rotateX(angle1);
      vel.rotateY(angle2);
      vel.rotateZ(angle3);

      vel.normalize();
      vel.scaleSelf(a);
    }
  }

  void display() {
    for (Particle p : particles) {
      for (Particle other : particles) {
        float d = p.distanceTo(other);
        if (d < 50) {
          strokeWeight(1);
          stroke(0, d);
          line(p.x, p.y, p.z, other.x, other.y, other.z);
        }
      }
    }
    
    Particle head = particles.get(0);
    head.lock();   

    Particle tail = particles.get(numPoints-1);
    tail.set(head); 
    
    noFill();
    beginShape(POINTS);
    stroke(0, 40);
    strokeWeight(radius*2);
    for (Particle p : particles) {
      vertex(p.x, p.y, p.z);
    }    
    endShape();

    
    beginShape();
    stroke(0, 10);
    strokeWeight(radius);
    for (Particle p : particles) {
      vertex(p.x, p.y, p.z);
    }
    endShape();
  }
}

