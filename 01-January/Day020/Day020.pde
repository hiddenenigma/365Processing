/* Source Cited:

 Nature of Code by Daniel Shiffman
 Chapter 2: Forces
 http://natureofcode.com
 
 */

Mover [] movers = new Mover[600];

void setup() {
  size(500, 500);
  smooth();
  frameRate(30);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1, 70), random(width+5), random(height+5));
  }
}

void draw() {
  // saveFrame("output/frames#################.tif");

  background(0);
  PVector wind = new PVector(0, 0);
  PVector gravity = new PVector(0, 5);
  for (int i = 0; i < movers.length; i++) {
    movers[i].applyForce(wind);
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

  float mass;

  Mover(float m, float x, float y) {
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  // Newton’s second law.
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
    if (mousePressed == true) {
      acceleration.sub(f);
    }
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);

    acceleration.mult(0);
  }

  void display() {
    noStroke();
    fill(255);
    ellipse(location.x, location.y, mass, mass);
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
      velocity.y *= -1;
      location.y = height;
    }
  }
}
