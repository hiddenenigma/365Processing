/* Source cited:
Nature of Code by Daniel Shiffman
Introduction
*/


Walker[] w = new Walker[100];

void setup() {
  size(500, 500);
  frameRate(30);
  noStroke();
  background(0);
  for (int i = 0; i < w.length; i++) {
    w[i] = new Walker(random(-50, height), random(width), random(10), random(255));
  }
}

void draw() {
//  saveFrame("output/frames#################.tif");

  fill(255);  
  for (int i = 0; i < w.length; i++) {
    w[i].step();
    w[i].display();
  }
}

class Walker {
  float x;
  float tx;
  float positionY;
  float mass;
  float randomFill;

  Walker(float y, float r, float m, float g) {
    tx = r;
    positionY = y;
    mass = m;
    randomFill = g;
  }

  void step() {
    x = map(noise(tx), 0, 1, -50, width+100);
    tx += 0.01;
  }

  void display() {
    pushMatrix();
    translate(0, 0);
    fill(randomFill);
    rect(x, positionY, mass, mass);
    popMatrix();
  }
}
