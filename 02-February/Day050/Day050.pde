/* Source cited:
 Nature of Code by Daniel Shiffman
 Chapter 3: Oscillation
 */

Walker [] walkers = new Walker[100];

void setup() {
  size(500, 500);
  frameRate(40);
  background(255);

  for (int i = 0; i < walkers.length; i++) {
    walkers[i] = new Walker(width/2, random(220, 270), random(-50, 50), random(-30, 30), random(50), random(.1, 2), random(100), random(255));
  }
}

void draw() {
  //saveFrame("output/frames#################.tif");

  for (int i = 0; i < walkers.length; i++) {
    walkers[i].display(); 
    walkers[i].update(); 
    walkers[i].step(); 
    walkers[i].checkEdges();
  }
}  

class Walker {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float loc;
  float loc2;
  float weight;
  float colour;
  float alpha;
  float angle = 0;
  float aVelocity = 0;
  float aAcceleration = random(-0.0001, 0.0001);

  Walker(float x, float y, float l, float l2, float m, float w, float c, float a) {
    location = new PVector(x, y);
    velocity = new PVector(random(-0.2, 0.2), random(-0.2, 0.2));
    acceleration = new PVector(random(-0.1, 0.1), random(-0.1, 0.1));
    loc = l;
    mass = m;
    weight = w;
    colour = c;
    alpha = a;
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    aVelocity += aAcceleration;
    aVelocity = constrain(aVelocity, -0.01, 0.01);
    angle += aVelocity;
    acceleration.mult(0);
  }

  void display() {
    stroke(colour, alpha);
    strokeWeight(weight);
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    line(loc, loc2, mass, mass);
    popMatrix();
  }

  void step() {
    int stepx = int(random(3))-1;
    int stepy = int(random(3))-1;
    //[end]
    location.x += stepx;
    location.y += stepy;
  }

  void checkEdges() {

    // When it reaches one edge, set location to the other.
    if (location.x > width+50) {
      location = new PVector(width/2, height/2);
    } else if (location.x < -50) {
      location = new PVector(width/2, height/2);
    }

    if (location.y > height+50) {
      location = new PVector(width/2, height/2);
    } else if (location.y < -50) {
      location = new PVector(width/2, height/2);
    }
  }
}
