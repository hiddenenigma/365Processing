/* Source Cited:

 Nature of Code by Daniel Shiffman
 Chapter 1: Vectors
 http://natureofcode.com
 
 */
Walker[] w = new Walker[500];

void setup() {
  size(500, 500);
  frameRate(30);
  smooth();
  for (int i = 0; i < w.length; i++) {
    w[i] = new Walker();
  }
  background(255);
}

void draw() {
  // saveFrame("output3/frames#################.tif");

  for (int i = 0; i < w.length; i++) {
    w[i].step();
    w[i].display();
    w[i].update();
  }
}

class Walker {
  PVector location;
  PVector velocity;
  PVector acceleration;


  Walker() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    acceleration = new PVector(random(-0.02, 0.02), random(-0.02, 0.02));
  }

  void update() {
    location.add(velocity);
    velocity.add(acceleration);
  }

  void display() {
    noStroke();
    fill(0, 50);
    ellipse(location.x, location.y, 3, 3);
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
