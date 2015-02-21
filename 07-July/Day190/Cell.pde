// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Cell {

  PVector loc;
  float r;
  
  Cell(float r_) {
    r = r_;
  }
  
  void display(float x, float y) {
    loc = new PVector(x,y);
    rectMode(CENTER);
    rect(loc.x, loc.y, r+10, r-19); 
  }
}
