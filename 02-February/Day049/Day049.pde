/* Source cited:
Nature of Code by Daniel Shiffman
Chapter 3: Oscillation
*/

Walker [] walkers = new Walker[150];

void setup() {
  size(500, 500);
  frameRate(24);
  for(int i = 0; i < walkers.length; i++) {
  walkers[i] = new Walker(random(width), random(10, height-20), random(20), random(50), random(10), 0);
  }  
}

void draw() {
//  saveFrame("output2/frames#################.tif");

  background(255);
  for(int i = 0; i < walkers.length; i++) {
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
  float weight;
  float colour;
  float angle = 0;
  float aVelocity = 0;
  float aAcceleration = random(-0.0001,0.0001);
  
  Walker(float x, float y, float l, float m, float w, float c) {
    location = new PVector(x, y);
    velocity = new PVector(random(-0.01,0.01), random(-0.01,0.01));
    acceleration = new PVector(0,0);
    loc = l;
    mass = m;
    weight = w;
    colour = c;
  }

  void update() {

    location.add(velocity);
    aVelocity += aAcceleration;
    aVelocity = constrain(aVelocity,-0.01,0.01);
    angle += aVelocity;

  }

  void display() {
    stroke(colour);
    strokeWeight(weight);
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    line(loc, loc, mass, mass);
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

    if (location.x > width+50) {
      location.x = 0;
    } else if (location.x < -50) {
      location.x = width;
    }

    if (location.y > height+50) {
      location.y = 0;
    } else if (location.y < -50) {
      location.y = height;
    }

  }
}
