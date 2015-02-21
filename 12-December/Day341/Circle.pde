class Circle {
  
  PVector loc;
  float radius;
  float period = 200;
  float t;
  float increment;
  
  Circle(float x, float y, float radius_, float t_, float increment_) {
    loc = new PVector(x, y);
    radius = radius_; 
    t = t_;
    increment = increment_;
  }
  
  void display() {
    for (int i = 0; i < radius; i += 15) {
      float n = noise(t) * radius;
      ellipse(loc.x, loc.y, i+n, i+n);  
    }    
    t+= increment;
  }
}
