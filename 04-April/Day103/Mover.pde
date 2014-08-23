class Mover {
  PVector loc;
  PVector vel;
  PVector acc;
  float s;
  float v = 1;
  float a = 0.01;
  float c;

  Mover(float c_, float s_) {
    loc = new PVector(width/2,height/2);
    vel = new PVector(random(-v,v),random(-v,v));
    acc = new PVector(random(-a,a),random(-a,a));
    s = s_;
    c = c_;
  }
  
  void run() {
    update();
    display();
    checkEdges();
  }
  
  void update() {
    loc.add(vel);
    vel.add(acc);
  }
    
  void display() {
    strokeWeight(s);
    if (mousePressed) {
      stroke(c);
    } else {
      stroke(255,10);
    }
    
    fill(c);
    noStroke();
    ellipse(loc.x,loc.y,s,s);
  }
  
  void checkEdges() {

    // When it reaches one edge, set location to the other.
    if (loc.x > width) {
      loc = new PVector(width/2, height/2);
      vel = new PVector(random(-v,v),random(-v,v));
      acc = new PVector(random(-a,a),random(-a,a));
    } else if (loc.x < 0) {
      loc = new PVector(width/2, height/2);
      vel = new PVector(random(-v,v),random(-v,v));
      acc = new PVector(random(-a,a),random(-a,a));
    }

    if (loc.y > height) {
      loc = new PVector(width/2, height/2);
      vel = new PVector(random(-v,v),random(-v,v));
      acc = new PVector(random(-a,a),random(-a,a));
    } else if (loc.y < 0) {
      loc = new PVector(width/2, height/2);
      vel = new PVector(random(-v,v),random(-v,v));
      acc = new PVector(random(-a,a),random(-a,a));
    }
  }
}
