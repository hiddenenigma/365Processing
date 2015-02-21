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

  void display(float x, float y) {
    loc = new PVector(x, y);
    vel = new PVector(random(-1, 1), random(-1, 1));
    loc.add(vel);
    ellipse(loc.x, loc.y, r, r);
  }
}

