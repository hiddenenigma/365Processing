/* Source cited:
 Nature of Code by Daniel Shiffman
 Chapter 3: Oscillation
 
 Vormplus: An Introduction to Processing
 http://vormplus.be/blog/article/an-introduction-to-processing
 */


Mover[] movers = new Mover[80];

void setup() {
  size(500, 500);
  strokeCap(PROJECT);

  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(40, 200), random(1,10), random(1, 20), random(-0.01, 0.01), random(0.1, 1.5), random(-0.02, -0.05), random(0.02, 0.05), random(0.1, 1), random(1.5,4));
  }
}

void draw() {
//  saveFrame("output/frames#################.tif");
  background(0);
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
  float randomWeight;
  float step = 20;
  float angle;
  
  float start;
  float stop;
  float rotation = - (HALF_PI / 3);
  
  float aVelocity = 0;
  float aAcceleration;
  float scaleArc;
  
  float b = 0.0;
  float s = 0.0;
  float constrain1;
  float constrain2;
  
  
  Mover(float m, float r, float a, float aA, float s3, float c1, float c2, float s1, float s2) {
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    mass = m + step;
    randomWeight = r;
    angle = a;
    aAcceleration = aA;
    scaleArc = s3;
    constrain1 = c1;
    constrain2 = c2;
    start = s1;
    stop = s2;
  }
  
  void update() {

    velocity.add(acceleration);
    location.add(velocity);

    aVelocity += aAcceleration;
    aVelocity = constrain(aVelocity, constrain1, constrain2);
    angle += aVelocity;
    acceleration.mult(0);
    
    s = cos(0.7)*1.5;

  }
  
    void display() {
    stroke(255);
    noFill();
    strokeWeight(randomWeight);
    rectMode(CENTER);
    pushMatrix();

    translate(location.x,location.y);
    rotate(angle);
    scale(s*scaleArc);
    arc(0,0,mass,mass, start, stop);
    popMatrix();
  }
  
}
