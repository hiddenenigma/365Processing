/* Source cited:
 Nature of Code by Daniel Shiffman
 Chapter 3: Oscillation
 */

Mover[] movers = new Mover[100];

void setup() {
  size(500, 500);
  background(0);
  frameRate(30);
  smooth();
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(5), random(255), random(180));
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
  float mass;
  float random;
  float angle = 0;
  float offset = width/2;
  float scalar;
  float speed = 0.03;
 
  Mover(float m, float r, float s) {
    mass = m;
    random = r;
    scalar = s;
    location = new PVector(0, 0);
  }
  
  void update() {
    location.x = offset + cos(angle) * scalar;
    location.y = offset + sin(angle) * scalar;
  }
  
  void display() {
    fill(random, 60);
    noStroke();
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    ellipse(0, 0, mass, mass);
    angle += speed;
    popMatrix();
  }
}
  
  
