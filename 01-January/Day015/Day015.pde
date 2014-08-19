/* Source Cited:

 Nature of Code by Daniel Shiffman
 Chapter 1: Vectors
 http://natureofcode.com
 
 */

Mover[] movers = new Mover[100];

void setup() {
  size(500, 500);
  smooth(); 
  background(255);
  for (int i = 0; i < movers.length; i++) {
    // Initialize each object in the array.
    movers[i] = new Mover();
  }
  frameRate(30);
}

void draw() {

  //  saveFrame("output/frames#################.tif");
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
  float topspeed;

  Mover () {
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    topspeed = 6;
  }

  void update() {
    PVector move = new PVector(random(width), random(height));
    PVector dir = PVector.sub(move, location);
    dir.normalize();
    // Scale.
    dir.mult(.1);
    // Set to acceleration.
    acceleration = dir;
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }

  void display() {
    stroke(0);
    fill(255);
    ellipse(location.x, location.y, 2, 2);
  }
}
