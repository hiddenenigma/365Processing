/* Source cited:
Nature of Code by Daniel Shiffman
Chapter 1: Vectors
*/

Mover[] movers = new Mover[100];

void setup() {
  size(500, 500);
  frameRate(30);
  smooth();
  background(255);
  for ( int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(40), random(3));
  }
}

void draw() {
  //  saveFrame("output/frames#################.tif");

  for (int i = 0; i < movers.length; i++) {
    movers[i].update();
    movers[i].display();
  }
}


class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  float random;
  float angle = 0;


  float a = 0.0;
  float s = 0.0;


  Mover(float m, float r) {
    mass = m;
    random = r;
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);

    acceleration.mult(0);
    a = a + 0.02;
    s = cos(a)*1.5;
  }

  void display() {
    noFill();
    strokeWeight(random);
    rectMode(CENTER);

    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    scale(s);
    ellipse(0, 0, mass*16, mass*16); 
    popMatrix();
    if (mousePressed==true) {
      stroke(255);
    } else {
      stroke(0);
    }
  }
} 
