/* Source cited:
Nature of Code by Daniel Shiffman
Chapter 1: Vectors
*/

Circle [] circles = new Circle[100];

void setup() {
  size(500, 500);
  background(0);
  smooth();
 for (int i = 0; i < circles.length; i++) {
    circles[i] = new Circle(random(10), random(3), random(255), random(375), random(0.1, 1));
  } 
}


void draw() {
//  saveFrame("output/frames#################.tif");
  noStroke();
  fill(0, 10);
  rect(0, 0, width, height);
  for (int i = 0; i < circles.length; i++) {
    circles[i].run();
  }
}

class Circle {
  
  PVector location;
  PVector velocity;
  float mass; // Diameter of the ring
  boolean on = false; // Turns the display on and off
  float weight;
  float alpha;
  float timeOut;
  float grow;
  
  Circle(float m, float w, float a, float t, float g) {
    location = new PVector(width/2, height/2);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    on = true;
    mass = m;
    weight = w;
    alpha = a;
    timeOut = t;
    grow = g;
  }
  
  void run() {
    grow();
    display();
    checkEdges();
  }
  
  void grow() {
//    location.add(velocity);
    if (on == true) {
      mass += grow;
      if (mass > timeOut) {
        mass = 0.0;
        location = new PVector(width/2, height/2);
      }
    }
  }
  
  void display() {

    if (on == true) {
      noFill();
      strokeWeight(weight);
      stroke(255, 50);
      ellipse(location.x, location.y, mass, mass);
    }
  }
  
  void checkEdges() {
      if ((location.x > width) || (location.x < 0)) { 
    velocity.x = velocity.x * -1; 
  } 
  if ((location.y > height) || (location.y < 0)) { 
    velocity.y = velocity.y * -1; 
    } 
  }
}
