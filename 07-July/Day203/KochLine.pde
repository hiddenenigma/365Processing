// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class KochLine {
  PVector start, end, vel, acc;
  float theta = 0;
  
  // constructor
  KochLine(PVector a, PVector b) {
    start = a.get();
    end = b.get();
    vel = new PVector(random(-0.1,0.1),random(-0.1,0.1));
    acc = new PVector(random(-0.01,0.01),random(-0.01,0.01));
  }
  
  void display() {
    if (frameCount > 20) {
      start.add(vel);
      end.add(vel);
      vel.add(acc);
    }
    stroke(0,50);
    strokeWeight(1);
    pushMatrix();
    rotate(theta);
    line(start.x, start.y, end.x, end.y);
    theta+=0.01;
    popMatrix();
  }
  
  PVector kochA() {
    return start.get();
  }
  
  PVector kochB() {
    PVector v = PVector.sub(end,start);
    v.div(5);
    v.add(start);
    return v;
  }
  
  PVector kochC() {
    PVector a = start.get();
    
    PVector v = PVector.sub(end,start);
    v.div(random(0.5,4));
    a.add(v);
    v.rotate(-radians(random(20,250)));
    a.add(v);
    return a;
  }
  
  PVector kochD() {
    PVector v = PVector.sub(end,start);
    v.mult(random(1/3.0,2/3.0));
    v.add(start);
    return v;
  }
  
  PVector kochE() {
    return end.get();
  }
}
