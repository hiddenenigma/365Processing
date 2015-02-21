class Ball {

  int ball_res;
  int ball_radius;

  Particle c; 
  Vec2D centre;
  ArrayList<Particle> cparts;
  
  Ball(int ball_res_, int ball_radius_, Vec2D centre_) {
    ball_res = ball_res_;
    ball_radius = ball_radius_;
    
    centre = centre_;
    c = new Particle(centre);
    c.lock();
    physics.addParticle(c);
    cparts=new ArrayList<Particle>();
    
    init();
  }

  void init() {
    for (int i=0; i<ball_res; i++) {
      Vec2D pos=Vec2D.fromTheta(i*TWO_PI/ball_res).scaleSelf(ball_radius).addSelf(c);
      Particle p = new Particle(pos);
      cparts.add(p);
      physics.addParticle(p);
      physics.addSpring(new VerletSpring2D(c, p, ball_radius, 0.05));
      if (i>0) {
        VerletParticle2D q=cparts.get(i-1);
        physics.addSpring(new VerletSpring2D(p, q, p.distanceTo(q), 1));
      }
    }
    Particle p=cparts.get(0);
    Particle q=cparts.get(ball_res-1);
    physics.addSpring(new VerletSpring2D(p, q, p.distanceTo(q), 1));
  }

  void display() {
    stroke(255,50);
    for (VerletSpring2D s : physics.springs) {
      line(s.a.x, s.a.y, s.b.x, s.b.y);
    }
  }
}

