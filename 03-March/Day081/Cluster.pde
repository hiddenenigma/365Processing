class Cluster {
  ArrayList <ParticleString2D> pstrings;
  ArrayList <ParticleString2D> pstrings2;
  ArrayList <ParticleString2D> pstrings3;

  ArrayList <Particle> particles;
  float s;
  float f;

  Cluster(float s_, float f_){
    s = s_;
    f = f_;
    pstrings = new ArrayList<ParticleString2D>();
    for (int i = 5; i < 345; i += 5) {
      pstrings.add(new ParticleString2D(physics, new Vec2D(80, i+75), Vec2D.fromTheta(0).scaleSelf(10), 35, 10, 1));
    }
      pstrings2 = new ArrayList<ParticleString2D>();
    for (int i = 5; i < 495; i += 5) {
      pstrings2.add(new ParticleString2D(physics, new Vec2D(5, i), Vec2D.fromTheta(0).scaleSelf(10), 50, 10, 1));
    }
     pstrings3 = new ArrayList<ParticleString2D>();
     for (int i = 5; i < 135; i += 5) {
      pstrings3.add(new ParticleString2D(physics, new Vec2D(180, i+180), Vec2D.fromTheta(0).scaleSelf(10), 15, 10, 1));
    }
    
    particles = new ArrayList<Particle>();
    for (int i = 0; i < 1; i ++) {
//      particles.add(new Particle(width/2, height/2));
    }
  }
  
  void display() {
    for(Iterator i=physics.springs.iterator(); i.hasNext();) {
      VerletSpring2D s=(VerletSpring2D)i.next();
      strokeWeight(0.5);
      stroke(0);
      line(s.a.x,s.a.y,s.b.x,s.b.y);
    }
    for(Iterator i=physics.particles.iterator(); i.hasNext();) {
      VerletParticle2D g=(VerletParticle2D)i.next();
      fill(0);
      ellipse(g.x,g.y,3,3);
      float m = 0.5;
      g.x += random(-m,m);
      g.y += random(-m,m);
   }
  }
}
