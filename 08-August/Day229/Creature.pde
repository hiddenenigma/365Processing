class Creature {
  
  ArrayList<Chain> chains;
  float radius;

  Creature(float r) {
    radius = r;
    chains = new ArrayList<Chain>();
    for (int i = 0; i < 150; i += 10) {
      float angle = i * TWO_PI / 150;
      float x = cos(angle)*radius;
      float y = sin(angle)*radius;
      chains.add(new Chain(new Vec3D(x, y, y), random(-150, 150), (int)random(100, 150), random(15), random(0.1, 0.5), random(360)));
    }
  }

  void display() {
    for (Chain c : chains) {
      c.display();
    }
  }
}

