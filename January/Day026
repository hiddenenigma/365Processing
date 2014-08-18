/* Source cited:
 Nature of Code by Daniel Shiffman
 Chapter 1: Vectors
 */

Line[] lines = new Line[200];

void setup() {
  size(500, 500);
  frameRate(15);
  for ( int i = 0; i < lines.length; i++) {
    lines[i] = new Line();
  }
}

void draw() {
  //  saveFrame("output/frames#################.tif");

  background(255);
  for (int i = 0; i < lines.length; i++) {
    lines[i].update();
    lines[i].display();
    lines[i].checkEdges();
  }
}

class Line {
  PVector location;
  PVector velocity;

  Line() {
    location = new PVector(random(width), height);
    velocity = new PVector(random(-1, 1), 0);
  }

  void update() {
    location.add(velocity);
  }

  void display() {
    fill(255);
    noStroke();
    stroke(0);
    strokeWeight(10);
    line(location.x, location.y-location.y, location.x, random(height));
    line(location.x, location.y, location.x, random(height));
  }

  void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }
  }
}
