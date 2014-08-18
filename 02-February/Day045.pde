/* Source cited:
Nature of Code by Daniel Shiffman
Chapter 1: Vectors

Amon P5
25 Life-Saving Tips for Processing
http://amnonp5.wordpress.com/2012/01/28/25-life-saving-tips-for-processing/
*/

Circle [] circles = new Circle[500];
float m = 75;

void setup() {
  size(500, 500);
  noStroke();
  smooth();
  frameRate(30);
  background(255);

  for (int i = 0; i < circles.length; i++) {
    circles[i] = new Circle(random(width/2), random(height/2), random(0.01, 0.09), random(20));
  }
}
 
void draw() {
//  saveFrame("output/frames#################.tif");

  for (int i = 0; i < circles.length; i++) {
    circles[i].display();
    circles[i].update();
  }
}

class Circle {
  PVector location;
  PVector velocity;
  float r;
  float radius;
  float mass;
  float count;

  
  Circle(float x, float y, float c, float m) {
    location = new PVector(width/2, height/2);
    velocity = new PVector(random(-1,1), random(-1,1));
    mass = m;
    count = c;
  }
  
  void update() {
    location.add(velocity);
    radius = noise(frameCount * count) * mass;
    color c = color(r);
    r = noise(frameCount * 0.02) * 75;
    fill(c,50);
  }

  
  void display() {
    ellipse(location.x, location.y, radius, radius);
  }
}
