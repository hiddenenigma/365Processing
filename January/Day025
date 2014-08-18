Curve[] c = new Curve[500];

void setup() {
  size(500, 500);
  smooth();
  frameRate(24);
  for (int i = 0; i < c.length; i++) {
    c[i] = new Curve();
  }
}


void draw() {
  //  saveFrame("output/frames#################.tif");
  background(255);
  for (int i = 0; i < c.length; i++) {
    c[i].display();
    c[i].checkEdges();
  }
}

class Curve {
  PVector location;
  PVector velocity;
  float a;

  Curve() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    a = 1;
  }

  void display() {
    stroke(0);
    strokeWeight(random(0.1, 1));
    noFill();
    bezier(location.x, location.y, a, a, random(width), random(height), location.x, location.y);
    a+=2;
  }

  void checkEdges() {
    if (a > 450) {
      a-=10;
    }
  }
}


