// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Diamond {
  PVector start, end, vel;
  float r;
  
  Diamond(PVector a, PVector b, float r_) {
    r = r_;
    start = a.get();
    end = b.get();
    vel = new PVector(random(-1,1), random(-1,1));
  }
  
  void display() {
    stroke(255);
    line(start.x, start.y, end.x, end.y);
  }
  
  PVector diamondA() {
    return start.get();
  }
  
  PVector diamondB() {
    PVector v = PVector.sub(end,start);
    v.div(2);
    v.add(start);
    return v;
  }
  
  PVector diamondC() {
    stroke(255,10,255);
    PVector a = end.get();
    
    PVector v = PVector.sub(start,end);
    v.div(3);
    a.add(v);
    
    v.rotate(radians(r));
    a.add(v);
    
    return a;
  }
  
  PVector diamondD() {
    PVector a = start.get();

    PVector v = PVector.sub(end, start);
    v.div(2);
    a.add(v);

    v.rotate(-radians(90));
    a.add(v);

    return a;
  }
  
  PVector diamondE() {
    PVector a = start.get();

    PVector v = PVector.sub(end, start);
    v.div(3);
    a.add(v);

    v.rotate(-radians(r));
    a.add(v);

    return a;
  }  
  
  PVector diamondF() {
    return end.get();
  }
}
