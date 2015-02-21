// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Cell {
  PVector location;
  float w;

  Cell(float w_) {
    w = w_;
  }

  void display(float x, float y) {
    location = new PVector(x, y);
    rect(location.x, location.y, w, w);
  }
}

