/* Source cited:
Nature of Code by Daniel Shiffman
Chapter 1: Vectors
*/

Rectangle [] rectangles = new Rectangle[300];
float m = 75;

void setup() {
  size(500, 500);
  noStroke();
  smooth();
  frameRate(30);
  strokeCap(SQUARE);

  for (int i = 0; i < rectangles.length; i++) {
    rectangles[i] = new Rectangle(random(width), random(200, height-100), random(0.01, 0.09), random(499,500), random(15));
  }

}
 
void draw() {
//  saveFrame("output/frames#################.tif");
  background(255);

  for (int i = 0; i < rectangles.length; i++) {
    rectangles[i].display();
    rectangles[i].update();
    rectangles[i].checkEdges();
  }

}

class Rectangle {
  PVector location;
  PVector velocity;
  float r;
  float radius;
  float mass;
  float count;
  float weight;
  
  Rectangle(float x, float y, float c, float m, float w) {
    location = new PVector(x, y);
    velocity = new PVector(random(-1,1), random(-1,1));

    mass = m;
    count = c;
    weight = w;
  }
  
  void update() {
    location.add(velocity);
    radius = noise(frameCount * .01) * mass;
  }

  
  void display() {
    stroke(0);
    strokeWeight(weight);
    line(location.x, location.y, location.x, radius);

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
