class Creature {
  ArrayList<Mesh> meshes;
  Attractor a;
  float m;
  Vec2D origin;
  
  Creature(Vec2D origin_, float m_) {
    meshes = new ArrayList<Mesh>();
    origin = origin_;
    m = m_;
    for (int i = 0; i < 1; i++) {
      meshes.add(new Mesh((int)random(2,4), 350, random(0.01, 0.05), origin));
    }
    a = new Attractor(origin);
  }

  void display() {
    for (Mesh m : meshes) {
      m.display();
    }
  }
}

