/* Source cited:
Nature of Code by Daniel Shiffman
Chapter 1: Vectors
*/

Circle [] circles = new Circle[100];

void setup() {
  size(500, 500);
  frameRate(60);
  background(0);
 for (int i = 0; i < circles.length; i++) {
    circles[i] = new Circle(random(width), random(height), random(10), random(3), random(255), random(150), random(0.1,0.8));
  } 
}


void draw() {
//  saveFrame("output2/frames#################.tif");
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
  float mass; 
  boolean on = false;
  float weight;
  float alpha;
  float timeOut;
  float r;
  float count;
  
  Circle(float x, float y, float m, float w, float a, float t, float c) {
    location = new PVector(x, y);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    on = true;
    mass = m;
    weight = w;
    alpha = a;
    timeOut = t;
    count = c;
  }
  
  void run() {
    grow();
    display();
  }
  
  void grow() {
      
//    location.add(velocity);
    if (on == true) {
      mass += count;
      if (mass > timeOut) {
        mass = 0.0;
        location = new PVector(random(width), random(height));
      }
    }
  }
  
  void display() {
    if (on == true) {
      noFill();
      strokeWeight(weight);
      color c = color(r);
      r = noise(frameCount * 0.02) * 255;
      stroke(c,alpha);      
      ellipse(location.x, location.y, mass, mass);
    }
  }
}
