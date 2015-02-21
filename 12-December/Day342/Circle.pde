class Circle {
  
  PVector loc, loc2;
  float radius;
  float period;
  float t;
  float increment;
  
  Circle(float x, float y, float radius_, float period_) {
    loc = new PVector(x, y);
    radius = radius_; 
    period = period_;
  }
  
  void display() {
    loc.x += random(-0.5,0.5);
    loc.y += random(-0.5,0.5);
    float r = radius * cos(frameCount / period);
    ellipse(loc.x, loc.y, r, r);  
  }
}
