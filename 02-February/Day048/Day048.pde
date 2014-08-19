/* Source cited:
Nature of Code by Daniel Shiffman
Chapter 1: Vectors
*/

Circle [] circles = new Circle[130];
float m = 75;

void setup() {
  size(500, 500);
  smooth();
  frameRate(30);
  strokeCap(SQUARE);

  for (int i = 0; i < circles.length; i++) {
    circles[i] = new Circle(random(width), random(height), random(0.01, 0.09), random(10), random(20));
  }
}
 
void draw() {
//  saveFrame("output/frames#################.tif");
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
  float weight;
  
  Circle(float x, float y, float c, float m, float w) {
    location = new PVector(x, y);
    velocity = new PVector(random(-1,1), random(-1,1));
    mass = m;
    count = c;
    weight = w;
  }
  
  void update() {
    location.add(velocity);
    radius = noise(frameCount * count) * mass;

  }
  
  void display() {
    stroke(0);
    strokeWeight(weight);
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
