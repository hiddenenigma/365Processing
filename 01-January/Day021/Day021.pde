/* Source Cited:

 Nature of Code by Daniel Shiffman
 Chapter 2: Forces
 http://natureofcode.com
 
 */

Mover [] movers = new Mover[500];

void setup() {
  size(500, 500);
  frameRate(30);
  smooth();
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }
}

void draw() {
  //  saveFrame("output/frames#################.tif");
  background(255);
  PVector gravity = new PVector(3, random(.1, .2));
  for (int i = 0; i < movers.length; i++) {
    movers[i].applyForce(gravity);
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
}

class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  // The object now has mass!
  float mass;
  float r;

  Mover() {
    mass = 4;
    r = random(.1, 3);
    location = new PVector(random(width), 20);
    velocity = new PVector(0, random(1, 3));
    acceleration = new PVector(0, 0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);

    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    strokeWeight(r);
    fill(175);
    line(location.x, height, random(width), 0);
  }

  void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }

    if (location.y > height) {
      velocity.y *= 0;
      location.y = height;
    }
  }
}
