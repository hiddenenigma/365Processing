class Particle{
  float x, y;
  
  Particle(float x_, float y_) { 
    x = x_;
    y = y_;

    physics.addBehavior(new AttractionBehavior(new Vec2D(x, y), width, -0.05));
  }

  void display() {

  }
  
  void pressed() {
    physics.addBehavior(new AttractionBehavior(new Vec2D(x, y), width, 0.1)); 
  }
  
  void released() {
    physics.addBehavior(new AttractionBehavior(new Vec2D(x, y), width, -0.1));
  }
}
  


