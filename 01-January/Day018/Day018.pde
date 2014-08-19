/* Source Cited:

 Nature of Code by Daniel Shiffman
 Chapter 1: Vectors
 http://natureofcode.com
 
 */

Mover [] movers = new Mover[2000];

void setup() {
  size(500, 500);
  for (int i = 0; i < movers.length; i++) {
    // Initialize each object in the array.
    movers[i] = new Mover();
  }
}

void draw() {
  //saveFrame("output/frames#################.tif");

  background(0);
  for (int i = 0; i < movers.length; i++) {
    //[full] Calling functions on all the objects in the array
    movers[i].update();
    //    movers[i].checkEdges();
    movers[i].display();
    //[end]
  }
}

class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed = 5;

  Mover() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    acceleration = new PVector(random(-0.001, 0.1), random(0.001, 0.1));
  }

  void update() {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, location);
    dir.normalize();
    dir.mult(.2);
    acceleration = dir;
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(topspeed);
    if (mousePressed == true) {
      velocity.sub(acceleration);
    }
  }

  void display() {
    noStroke();
    fill(255);
    ellipse(location.x, location. y, 2, 2);
  }
}
