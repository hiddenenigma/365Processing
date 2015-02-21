// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class KochLine {
  PVector start, end;
  float r;
  
  KochLine(PVector a, PVector b, float r_) {
    start = a.get();
    end = b.get();
    r = r_;

  }
  
  void display() {
    stroke(255);
    line(start.x, start.y, end.x, end.y);
  }
  
  PVector kochA() {
    return start.get();
  }
  
  PVector kochB() {
    PVector v = PVector.sub(end, start);
    v.div(3);
    v.add(start);
    return v;
  }

  PVector kochC() {
    PVector a = start.get();

    PVector v = PVector.sub(end, start);
    v.div(2);
    a.add(v);

    v.rotate(-radians(r));
    a.add(v);

    return a;
  }

  PVector kochD() {
    PVector v = PVector.sub(end, start);
    v.mult(2/3.0);
    v.add(start);
    return v;
  }
  
  PVector kochE() {
    return end.get();
  }  
}

