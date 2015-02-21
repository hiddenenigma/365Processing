class Creature {
  ArrayList<Chain> chains;

  float radius;

  Creature(float r) {
    radius = r;
    chains = new ArrayList<Chain>();
    for (int i = 0; i < 150; i ++) {
      //      for (int j = -height/2; j < height/2; j+= 10) {
      float angle = i * TWO_PI / 150;
      float x = cos(angle)*radius;
      float y = sin(angle)*radius;
      chains.add(new Chain(x, y, random(150), (int)random(50, 100), random(15), random(0.1,0.5)));
      //    }
    }
  }

  void display() {
    for (Chain c : chains) {
      c.display();
    }
  }
}

