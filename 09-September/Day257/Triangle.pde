class Triangle {

  int numTri;
  int sizeTri;

  Particle c; 
  Vec2D centre;
  ArrayList<Particle> cparts;
  
  Triangle(int numTri_, int sizeTri_, Vec2D centre_) {
    numTri = numTri_;
    sizeTri = sizeTri_;
    
    centre = centre_;
    c = new Particle(centre);
    physics.addParticle(c);
    cparts=new ArrayList<Particle>();
    
    init();
  }

  void init() {
    for (int i=0; i<numTri; i++) {
      Vec2D pos=Vec2D.fromTheta(i*TWO_PI/numTri).scaleSelf(sizeTri).addSelf(c);
      Particle p = new Particle(pos);
      cparts.add(p);
      physics.addParticle(p);
      physics.addSpring(new VerletSpring2D(c, p, sizeTri, 0.05));
      if (i>0) {
        VerletParticle2D q=cparts.get(i-1);
        physics.addSpring(new VerletSpring2D(p, q, p.distanceTo(q), 1));
      }
    }
    Particle p=cparts.get(0);
    Particle q=cparts.get(numTri-1);
    physics.addSpring(new VerletSpring2D(p, q, p.distanceTo(q), 1));
  }

  void display() {
    stroke(255);
    for (VerletSpring2D s : physics.springs) {
      line(s.a.x, s.a.y, s.b.x, s.b.y);
    }
  }
}

