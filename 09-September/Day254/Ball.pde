class Ball {
  int string_res=20;
  int ball_res=20;
  int ball_radius;
  Vec2D origin;
  Particle c;
  ArrayList<Particle> cparts;
  
  Ball(int ball_radius_, Vec2D origin_) {
    ball_radius = ball_radius_;
    origin = origin_;
    c=new Particle(origin, string_res);    
    cparts=new ArrayList<Particle>();
    connect();
  }

  void connect() {
    physics.addParticle(c);    
    for (int i=0; i < ball_res; i++) {
      Vec2D pos=Vec2D.fromTheta(i*TWO_PI/ball_res).scaleSelf(ball_radius).addSelf(c);
      Particle p = new Particle(pos, string_res);
      cparts.add(p);
      physics.addParticle(p);
      physics.addSpring(new VerletSpring2D(c, p, ball_radius, 0.01));
      if (i>0) {
        Particle q=cparts.get(i-1);
        physics.addSpring(new VerletSpring2D(p, q, p.distanceTo(q), 1));
      }
    }
    Particle p=cparts.get(0);
    Particle q=cparts.get(ball_res-1);
    physics.addSpring(new VerletSpring2D(p, q, p.distanceTo(q), 1));
  }

  void display() {
    stroke(255,10);
    for (VerletSpring2D s : physics.springs) {
      line(s.a.x, s.a.y, s.b.x, s.b.y);
    }
  }
}

