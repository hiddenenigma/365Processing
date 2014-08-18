/* Source cited:
 Nature of Code by Daniel Shiffman
 Chapter 3: Oscillation
 */


Mover[] movers = new Mover[100];

void setup() {
  size(500, 500);
  frameRate(30);
  background(255);

  smooth();
  for ( int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(40), random(3), random(200, 255));
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
  float random2;
  float angle = 0;


  float a = 0.0;
  float s = 0.0;

  Mover(float m, float r, float r2) {
    mass = m;
    random = r;
    random2 = r2;
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
    fill(random2);
    strokeWeight(random);
    rectMode(CENTER); 
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    scale(s);
    rect(0, 0, mass*16, mass*16); 
    popMatrix();
  }
} 
