class Particle {

  Particle() { 
    physics.addBehavior(new AttractionBehavior(new Vec2D(width/2, height/2), width, -0.1));
  }

  void display() {
    noFill();
    noStroke();
    ellipse(10, 19, 15, 15);
  }

  void pressed() {
    physics.addBehavior(new AttractionBehavior(new Vec2D(width/2, height/2), width, 1));
  }

  void released() {
    physics.addBehavior(new AttractionBehavior(new Vec2D(width/2, height/2), width, -1));
  }
}


