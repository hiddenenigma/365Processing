class System {
  ArrayList<Creature> creatures;
  float rad;  
  PVector origin, vel;
  float p;
  float t;

  System(float x, float y, float rad_) {
    origin = new PVector(x,y);
    vel = new PVector(random(-0.2,0.2), random(-0.2,0.2));
    rad = rad_;
    p = random(30, 60);
  }

  void display() {
    origin.add(vel);
    creatures = new ArrayList<Creature>();
    for (int i = 0; i < rad; i +=1) {
      creatures.add(new Creature(origin.x, origin.y, 10, i, p));
    }    
    for (Creature c : creatures) {
      c.run();
    }
  }
}

