/* Source Cited:

 Nature of Code by Daniel Shiffman
 Chapter 1: Vectors
 http://natureofcode.com
 
 */

Walker[] w = new Walker[500];

void setup() {
  size(500, 500);
  frameRate(30);
  for (int i = 0; i < w.length; i++) {
    w[i] = new Walker();
  }
}

void draw() {
  //  saveFrame("output3/frames#################.tif");
  background(0);
  for (int i = 0; i < w.length; i++) {
    w[i].step();
    w[i].update();
    w[i].display();
  }
}

class Walker {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float d = random(.01, 2);
  float topspeed = 5;

  Walker() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0.1, 0.1);
  }

  void update() {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, location);
    dir.normalize();
    dir.mult(.4);
    acceleration = dir;
    velocity.add(acceleration);
    location.add(velocity);
  }

  void display() {

    noStroke();
    fill(255);
    ellipse(location.x, location.y, d, d);

    if (mousePressed == true) {
      d -= .5;
    } else {
      d+= .5;
    }
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
