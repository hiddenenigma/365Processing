// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Cell {

  PVector loc;
  PVector vel;
  float r;
  
  Cell(float r_) {
    r = r_;
  }
  
  void display(float x_, float y_) {
    loc = new PVector(x_,y_);
    vel = new PVector(random(-1,1), random(-1,1));
    loc.add(vel);
    rectMode(CENTER);
    for (int i = 0; i < width; i += 50) {
      for (int j = 0; j < height; j += 50) {
            ellipse(loc.x+i,loc.y+j,r,r); 
      }
    }
  }
}
