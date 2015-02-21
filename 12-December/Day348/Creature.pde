class Creature {
  ArrayList<Mesh> meshes;
  Attractor a;
  float m;
  Vec2D origin;
  
  Creature(Vec2D origin_, float m_) {
    meshes = new ArrayList<Mesh>();
    origin = origin_;
    m = m_;
    for (int i = 0; i < m; i++) {
      meshes.add(new Mesh(100, 100, 0.1, origin));
    }
    a = new Attractor(new Vec2D(width/2, height/2));
//    a.lock();
  }

  void display() {
    for (Mesh m : meshes) {
      m.display();
    }
  }
}

