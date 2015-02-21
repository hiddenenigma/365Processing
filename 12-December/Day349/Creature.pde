class Creature {
  ArrayList<Mesh> meshes;
  float m;
  Vec2D origin;
  
  Creature(Vec2D origin_, float m_) {
    meshes = new ArrayList<Mesh>();
    origin = origin_;
    m = m_;
    for (int i = 0; i < m; i++) {
      meshes.add(new Mesh(2, (int)random(2,10), random(0.01,0.05), origin));
    }
  }

  void display() {
    for (Mesh m : meshes) {
      m.display();
    }
  }
}

