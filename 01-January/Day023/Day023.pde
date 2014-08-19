/* Source Cited:

 Nature of Code by Daniel Shiffman
 Chapter 1: Vectors
 http://natureofcode.com
 
 */

Walker[] w = new Walker[200];

void setup() {
  size(500, 500);
  frameRate(30);
  background(255);
  for (int i = 0; i < w.length; i++) {
    w[i] = new Walker();
  }
}

void draw() {
  //  saveFrame("output/frames#################.tif");

  for (int i = 0; i < w.length; i++) {
    w[i].step();
    w[i].display();
    w[i].checkEdges();
  }
}

class Walker {
  PVector location;
  float r = random(5);

  Walker() {
    location = new PVector(width/2, height/2);
  }

  void display() {
    fill(random(255));
    noStroke();
    rect(location.x, location.y, r, r);
  }

  void step() {

    int choice = int(random(4));
    if (choice == 0) {
      location.x+=5;
    } else if (choice == 1) {
      location.x-=5;
    } else if (choice == 2) {
      location.y+=5;
    } else {
      location.y-=5;
    }
    //[end]
  }

  void checkEdges() {
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
  }
}

//
