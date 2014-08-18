/* Source cited:
 Nature of Code by Daniel Shiffman
 Chapter 2: Forces
 */

Mover[] movers = new Mover[100];

void setup() {
  size(500, 500);
  background(0);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(1, 7));
  }
}

void draw() {
  //  saveFrame("output/frames#################.tif");

  for (int i = 0; i < movers.length; i++) {
    PVector gravity = new PVector(0, 0.04);
    movers[i].applyForce(gravity);
    movers[i].update();
    movers[i].display();
  }
}

class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover(float m) {
    mass = m;
    location = new PVector(width/2, height/2);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    acceleration = new PVector(random(-1, 1), random(-1, -1));
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
    if (mousePressed==true) {
      noStroke();
      fill(255);
      ellipse(location.x, location.y, 1*mass, 1*mass);
    }
  }
}
