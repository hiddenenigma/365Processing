class Particle{
  float x, y;
  
  Particle(float x_, float y_) { 
    x = x_;
    y = y_;

    physics.addBehavior(new AttractionBehavior(new Vec2D(x, y), width, -0.02));
//    physics.addBehavior(new AttractionBehavior(new Vec2D(100, 100), width, -0.05));
//    physics.addBehavior(new AttractionBehavior(new Vec2D(400, 400), width, -0.05));
  }
}
  


