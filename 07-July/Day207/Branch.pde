// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Branch {
  PVector start, end;
  float theta;
  float r, w;

  Branch(PVector a, PVector b, float r_) {
    start = a.get();
    end = b.get();
    r = r_;
    w = 5;
  }

  void display() {
    strokeWeight(1);
    stroke(255,20);
    line(start.x, start.y, end.x, end.y);
  }

  PVector branchA() {
    return start.get();
  }

  PVector branchB() {
    return end.get();
  }

  PVector branchC() {
    PVector a = end.get();
    PVector v = PVector.sub(end, start);
    v.div(3);
    a.add(v);

    v.rotate(radians(r));
    a.add(v);

    return a;
  }

  PVector branchD() {
    PVector a = end.get();
    PVector v = PVector.sub(end, start);
    v.div(3);
    a.add(v);

    v.rotate(-radians(r));
    a.add(v);

    return a;
  }
}

