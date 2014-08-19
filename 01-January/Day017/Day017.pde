/* Source cited:

Nature of Code by Daniel Shiffman
Chapter 1: Vectors
http://natureofcode.com

*/

Walker[] w = new Walker[1000];

void setup() {
  size(500, 500);
  frameRate(30);
  for (int i = 0; i < w.length; i++) {
    w[i] = new Walker();
  }
}

void draw() {
//  saveFrame("output/frames#################.tif");
  background(0);


  for (int i = 0; i < w.length; i++) {
    w[i].step();
    w[i].display();
  }
}

class Walker {
  PVector location;
  float r = random(50, 450);

  Walker() {
    location = new PVector(width/2, height/2);
  }

  void display() {
    stroke(255, random(90));
    strokeWeight(1);
    line(location.x, location.y, width/2, height/2);
  }

  void step() {

    int choice = int(random(4));
    if (choice == 0) {
      location.x++;
    } else if (choice == 1) {
      location.x--;
    } else if (choice == 2) {
      location.y++;
    } else {
      location.y--;
    }
  }
}


