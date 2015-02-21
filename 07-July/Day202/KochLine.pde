// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class KochLine {
  
  PVector start, end, vel;
  float c;
  
  KochLine(PVector a, PVector b, float c_) {
    start = a.get();
    end = b.get();
    vel = new PVector(random(-0.5,0.5),random(-0.5,0.5));
    c=c_;
  }
  
  void display() {
    start.add(vel);
    end.add(vel);
    stroke(255,80);
    line(start.x, start.y, end.x, end.y);
    stroke(0,10);
    line(width/2, height/2, start.x, start.y);
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
    v.div(3);
    a.add(v);
    v.rotate(-radians(60));
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
