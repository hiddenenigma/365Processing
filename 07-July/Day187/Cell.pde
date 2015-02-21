// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Cell {

  PVector loc;
  int r;

  Cell(int r_) {
    r = r_;
  }
  
  void display(float x, float y) {
    loc = new PVector(x,y);
    rect(loc.x,loc.y,r,r);
  }
}
