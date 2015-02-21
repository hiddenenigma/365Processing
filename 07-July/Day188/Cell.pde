// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Cell {

  PVector loc;
  int r;
  
  Cell(int r_) {
    r = r_;
  }
  
  void display(float x_, float y_) {
    loc = new PVector(x_,y_);
    rectMode(CENTER);
    rect(loc.x, loc.y, r, r); 
  }
}
