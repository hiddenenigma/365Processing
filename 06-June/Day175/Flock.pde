class Flock {
  ArrayList<Boid> boids;
  
  Flock() {
    boids = new ArrayList<Boid>();
  }
  
  void run() {
    Iterator<Boid> it = boids.iterator();
    while (it.hasNext()) {
      Boid b = it.next();
      b.run(boids);
      if (b.isDead()) {
        it.remove();
      }
    }
  }

  void addBoid(Boid b) {
    boids.add(b);
  }
}
