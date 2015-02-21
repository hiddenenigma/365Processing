class Square {

  PVector loc, vel;
  float d;
  float theta;

  Square(PVector l, float d_, float theta_) {
    loc = l.get();
    d = d_;
    theta = 0;
  }

  void update() {
    vel = new PVector(random(-0.1, 0.1), random(-0.1, 0.1));
    loc.add(vel);
  }

  void display() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(theta);
    strokeWeight(10);
    beginShape();
    vertex(d, d*2);
    vertex(-d*2, d*2);
    vertex(d/2, -d/2);
    endShape();

    if (d%2 == 0) {
      stroke(0);
      theta+= 0.05;
    } else {
      stroke(255);
      theta += 0.05;
    }
    popMatrix();
  }
}

