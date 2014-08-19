/* Source cited:
Nature of Code by Daniel Shiffman
Chapter 1: Vectors

Amon P5
25 Life-Saving Tips for Processing
http://amnonp5.wordpress.com/2012/01/28/25-life-saving-tips-for-processing/
*/

Circle [] circles = new Circle[6000];
float m = 75;

void setup() {
  size(500, 500);
  noStroke();
  smooth();
  frameRate(30);


  for (int i = 0; i < circles.length; i++) {
    circles[i] = new Circle(random(width), random(height), random(0.01, 0.09), random(70));
  }

}
 
void draw() {
//  saveFrame("output2/frames#################.tif");
  background(255);

  for (int i = 0; i < circles.length; i++) {
    circles[i].display();
    circles[i].update();
    circles[i].checkEdges();
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
    location = new PVector(x, y);
    velocity = new PVector(random(-1,1), random(-1,1));
    mass = m;
    count = c;
  }
  
  void update() {
    location.add(velocity);
    radius = noise(frameCount * .02) * mass;
    color c = color(r);
    r = noise(frameCount * 0.02) * 50;
    fill(c,95);
  }

  
  void display() {

    ellipse(location.x, location.y, radius, radius);

  }
  
    void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }

    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    } else if (location.y < 0) {
      velocity.y *= -1;
      location.y = 0;
    }
  }
}
