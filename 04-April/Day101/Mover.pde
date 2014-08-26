class Mover {
  PVector loc1;
  PVector loc2;
  PVector vel1;
  PVector vel2;
  PVector acc1;
  PVector acc2;
  float d, c;
  float opac;

  Mover(float opac_, float c_) {
    loc1 = new PVector(random(width), random(height));
    loc2 = new PVector(random(width), random(height));
    vel1 = new PVector(random(-1, 1), random(-1, 1));
    vel2 = new PVector(random(-1, 1), random(-1, 1));
    acc1 = new PVector(random(-0.01, 0.01), random(-0.01, 0.01));
    acc2 = new PVector(random(-0.01, 0.01), random(-0.01, 0.01));
    d = 1;
    c=c_;
    opac = opac_;
  }

  void run() {
    update();
    display();
    checkEdges();
  }

  void update() {
    loc1.add(vel1);
    loc2.add(vel2);
    vel1.add(acc1);
    vel2.add(acc2);
  }

  void display() {
    float dst = dist(loc1.x, loc1.y, loc2.x, loc2.y);
    if (dst < 200) {
      fill(0, 255-dst);
      ellipse(loc1.x, loc1.y, d, d);
      ellipse(loc2.x,loc2.y,d,d);
      stroke(0, 100-dst);
      strokeWeight(1);
      line(loc1.x, loc1.y, loc2.x,loc2.y);
    }
  }

  void checkEdges() {
    if (loc1.x > width) {
      loc1.x = width;
      vel1.x *= -1;
    } 
    else if (loc1.x < 0) {
      vel1.x *= -1;
      loc1.x = 0;
    }
    if (loc1.y > height) {
      loc1.y = height;
      vel1.y *= -1;
    } 
    else if (loc1.y < 0) {
      vel1.y *= -1;
      loc1.y = 0;
    }

    if (loc2.x > width) {
      loc2.x = width;
      vel2.x *= -1;
    } 
    else if (loc2.x < 0) {
      vel2.x *= -1;
      loc2.x = 0;
    }
    if (loc2.y > height) {
      loc2.y = height;
      vel2.y *= -1;
    } 
    else if (loc2.y < 0) {
      vel2.y *= -1;
      loc2.y = 0;
    }
  }
}
