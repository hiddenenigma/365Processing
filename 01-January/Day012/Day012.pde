/* Source Cited:

Nature of Code by Daniel Shiffman
Chapter 1: Vectors
http://natureofcode.com

*/

// An array of objects
Mover[] movers = new Mover[25];

void setup() {
  size(500, 500);
  smooth(); 
  background(255);
  for (int i = 0; i < movers.length; i++) {
    // Initialize each object in the array.
    movers[i] = new Mover();
  }
//    frameRate(24);

}

void draw() {
//  saveFrame("output3/frames#################.tif");
  for (int i = 0; i < movers.length; i++) {
    //[full] Calling functions on all the objects in the array
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
    //[end]
  }
}

class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  Mover() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    topspeed = 4;
  }

  void update() {

    // <b><u>Our algorithm for calculating acceleration</b></u>:

    //[full] Find the vector pointing towards the mouse.
    PVector mouse = new PVector(mouseX,mouseY);
    PVector dir = PVector.sub(mouse,location);
    //[end]
    // Normalize.
    dir.normalize();
    // Scale.
    dir.mult(.5);
    // Set to acceleration.
    acceleration = dir;

    //[full] Motion 101! Velocity changes by acceleration.  Location changes by velocity.
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    //[end]
  }

  // Display the Mover
  void display() {
    stroke(0);
    fill(255);
    ellipse(location.x,location.y,20,20);
  }

  // What to do at the edges
  void checkEdges() {

    if (location.x > width) {
      location.x = 10;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 10;
    }  else if (location.y < 0) {
      location.y = height;
    }
  }
}
